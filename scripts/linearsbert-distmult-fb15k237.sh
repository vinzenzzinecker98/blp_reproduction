#!/bin/bash

source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate

python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='linearsbert' \
rel_model='distmult' \
loss_fn='margin' \
encoder_name='sentence-transformers/bert-base-nli-mean-tokens' \
regularizer=0 \
max_len=32 \
num_negatives=64 \
lr=1e-3 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False \
output_dir="output/linearsbert-distmult-fb15k237/"


