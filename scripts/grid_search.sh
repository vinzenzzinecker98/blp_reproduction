#!/bin/bash

source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate
timestamp() {
  date +"%d.%m.%Y - %T - starting job:" 
}
timestamp
echo '1e5, margin'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='margin' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=1e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp
echo '2e5, margin'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='margin' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=2e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp
echo '5e5, margin'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='margin' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=5e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp
echo '1e5, nll'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='nll' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=1e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp
echo '2e5, nll'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='nll' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=2e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp
echo '5e5, nll'
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='transe' \
loss_fn='nll' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=5e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False
timestamp