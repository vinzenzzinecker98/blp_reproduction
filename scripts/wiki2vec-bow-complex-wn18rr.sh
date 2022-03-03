#!/bin/bash
source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate

python train.py link_prediction with \
dataset='WN18RR' \
inductive=True \
model='wiki2vec-bow' \
rel_model='complex' \
loss_fn='margin' \
regularizer=1e-2 \
max_len=32 \
num_negatives=64 \
lr=1e-3 \
use_scheduler=False \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=32 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False \
output_dir="output/wiki2vec-transe-fb15k237/"