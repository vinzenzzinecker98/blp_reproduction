# this is for looking up the SBERT embeddings, according to Documentation https://huggingface.co/sentence-transformers/bert-base-nli-mean-tokens (See Usage (HuggingFace Transformers))

import torch
from transformers import AutoTokenizer, AutoModel

model = AutoModel.from_pretrained('sentence-transformers/bert-base-nli-mean-tokens')
device = torch.device('cuda:0')
model.to(device)
global embeddings
embeddings ={}

def mean_pooling(model_output, attention_mask):
    token_embeddings = model_output[0] #First element of model_output contains all token embeddings
    input_mask_expanded = attention_mask.unsqueeze(-1).expand(token_embeddings.size()).float()
    return torch.sum(token_embeddings * input_mask_expanded, 1) / torch.clamp(input_mask_expanded.sum(1), min=1e-9)

def sbertlookup(text, mask):
    #print("device text: ", text.is_cuda)
    #print("device mask: ", mask.is_cuda)
    if text in embeddings.keys():
        return embeddings[text]
    else:
        with torch.no_grad():
            x = model(text, mask)
        sentence_embeddings = mean_pooling(x, mask)
        embeddings[text]=sentence_embeddings
        return sentence_embeddings.to(device)
