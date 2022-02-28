#!/bin/bash
source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate
python train.py link_prediction with \
dataset='Wikidata5M' \
inductive=True \
dim=128 \
model='blp' \
rel_model='complex' \
loss_fn='margin' \
encoder_name='distilbert-base-uncased' \
regularizer=1e-3 \
max_len=64 \
num_negatives=64 \
lr=5e-5 \
use_scheduler=True \
batch_size=1024 \
emb_batch_size=12288 \
eval_batch_size=2 \
max_epochs=5 \
checkpoint=None \
use_cached_text=False \
output_dir="output/distilbert-complex-wikidata5m/"
