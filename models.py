import torch
import torch.nn as nn
import torch.nn.functional as F
from transformers import AlbertModel


class BED(nn.Module):
    def __init__(self, dim, rel_model, loss_fn, num_relations, encoder_name):
        super().__init__()
        self.dim = dim
        self.normalize_embs = False

        if rel_model == 'transe':
            self.score_fn = transe_score
            self.normalize_embs = True
        elif rel_model == 'distmult':
            self.score_fn = distmult_score
        elif rel_model == 'complex':
            self.score_fn = complex_score
            self.dim *= 2
        elif rel_model == 'simple':
            self.score_fn = simple_score
            self.dim *= 2
        else:
            raise ValueError(f'Unknown relational model {rel_model}.')

        if loss_fn == 'margin':
            self.loss_fn = margin_loss
        elif loss_fn == 'nll':
            self.loss_fn = nll_loss
        else:
            raise ValueError(f'Unkown loss function {loss_fn}')

        self.encoder = AlbertModel.from_pretrained(encoder_name,
                                                   output_attentions=False,
                                                   output_hidden_states=False)
        enc_out_dim = self.encoder.config.hidden_size
        self.enc_linear = nn.Linear(enc_out_dim, self.dim, bias=False)

        self.rel_emb = nn.Embedding(num_relations, self.dim)
        nn.init.kaiming_uniform_(self.rel_emb.weight, nonlinearity='linear')

    def encode_description(self, tokens, mask):
        # Encode text and extract representation of [CLS] token
        embs = self.encoder(tokens, mask)[0][:, 0]
        embs = self.enc_linear(embs)

        if self.normalize_embs:
            embs = F.normalize(embs, dim=-1)

        return embs

    def forward(self, pairs_tokens, pairs_mask, rels, neg_idx):
        batch_size, _, num_tokens = pairs_tokens.shape

        # Obtain embeddings for [CLS] token
        embs = self.encode_description(pairs_tokens.view(-1, num_tokens),
                                       pairs_mask.view(-1, num_tokens))
        embs = embs.view(batch_size, 2, -1)

        # Scores for positive samples
        rels = self.rel_emb(rels)
        heads, tails = torch.chunk(embs, chunks=2, dim=1)
        pos_scores = self.score_fn(heads, tails, rels)

        # Scores for negative samples
        neg_embs = embs.view(batch_size * 2, -1)[neg_idx]
        heads, tails = torch.chunk(neg_embs, chunks=2, dim=1)
        neg_scores = self.score_fn(heads.squeeze(), tails.squeeze(), rels)

        loss = self.loss_fn(pos_scores, neg_scores)

        return loss


def transe_score(heads, tails, rels):
    return -torch.norm(heads + rels - tails, dim=-1, p=1)


def distmult_score(heads, tails, rels):
    return torch.sum(heads * rels * tails, dim=-1)


def complex_score(heads, tails, rels):
    heads_re, heads_im = torch.chunk(heads, chunks=2, dim=-1)
    tails_re, tails_im = torch.chunk(tails, chunks=2, dim=-1)
    rels_re, rels_im = torch.chunk(rels, chunks=2, dim=-1)

    return torch.sum(rels_re * heads_re * tails_re +
                     rels_re * heads_im * tails_im +
                     rels_im * heads_re * tails_im -
                     rels_im * heads_im * tails_re,
                     dim=-1)


def simple_score(heads, tails, rels):
    heads_h, heads_t = torch.chunk(heads, chunks=2, dim=-1)
    tails_h, tails_t = torch.chunk(tails, chunks=2, dim=-1)
    rel_a, rel_b = torch.chunk(rels, chunks=2, dim=-1)

    return torch.sum(heads_h * rel_a * tails_t +
                     tails_h * rel_b * heads_t, dim=-1) / 2


def margin_loss(pos_scores, neg_scores):
    loss = 1 - pos_scores + neg_scores
    loss[loss < 0] = 0
    return loss.mean()


def nll_loss(pos_scores, neg_scores):
    return (F.softplus(-pos_scores).mean() + F.softplus(neg_scores).mean()) / 2
