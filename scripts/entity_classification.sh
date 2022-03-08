#!/bin/bash
source /pfs/data5/home/kit/stud/ucgvm//environment/bin/activate
echo "distilbert-transe-fb15k237"
python train.py node_classification with \
dataset='FB15k-237' \
checkpoint='distilbert-transe-fb15k237'
echo "distilbert-distmult-fb15k237"
python train.py node_classification with \
dataset='FB15k-237' \
checkpoint='distilbert-distmult-fb15k237'
echo "distilbert-complex-fb15k237"
python train.py node_classification with \
dataset='FB15k-237' \
checkpoint='distilbert-complex-fb15k237'
echo "distilbert-simple-fb15k237"
python train.py node_classification with \
dataset='FB15k-237' \
checkpoint='distilbert-simple-fb15k237'
echo "distilbert-transe-wn18rr"
python train.py node_classification with \
dataset='WN18RR' \
checkpoint='distilbert-transe-wn18rr'
echo "distilbert-distmult-wn18rr"
python train.py node_classification with \
dataset='WN18RR' \
checkpoint='distilbert-distmult-wn18rr'
echo "distilbert-complex-wn18rr"
python train.py node_classification with \
dataset='WN18RR' \
checkpoint='distilbert-complex-wn18rr'
echo "distilbert-simple-wn18rr"
python train.py node_classification with \
dataset='WN18RR' \
checkpoint='distilbert-simple-wn18rr'
