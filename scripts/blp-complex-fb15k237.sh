#!/bin/bash
source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate
python train.py link_prediction with \
dataset='FB15k-237' \
inductive=True \
dim=128 \
model='blp' \
rel_model='complex' \
loss_fn='margin' \
encoder_name='distilbert-base-uncased' \
regularizer=1e-3 \
max_len=32 \
num_negatives=64 \
lr=2e-5 \
use_scheduler=True \
batch_size=64 \
emb_batch_size=512 \
eval_batch_size=64 \
max_epochs=40 \
checkpoint=None \
use_cached_text=False \
output_dir="output/distilbert-complex-fb15k237/"
