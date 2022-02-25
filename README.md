Reproduction of https://github.com/dfdazac/blp for the Seminar "Representation Learning on Knowledge graphs"

How to run:
 - clone repository
 - create virtual environment
 - run `pip install -r requirements.txt`


update the paths:
 - in ./scripts change the paths to point to the virtual environment

Run the preconfigured scripts in ./scripts, or run `train.py link_prediction` with all arguments

Models:
 - model="blp": Uses the original architecture, except for using DistilBert instead of BERT for faster Runtime.
 - model="linearsbert": Uses only pretrained embeddings (sentence-BERT from the transformers library), with a Linear Layer
 - model="wiki2vec-bow": Uses a Bag-of-Words model using pretrained Wiki2vec Embeddings, analog to the GloVe-BOW Model. To generate the files needed, download the embeddings from https://wikipedia2vec.github.io/wikipedia2vec/pretrained/ (.txt) and run `./data/utils.py wiki2vec` to generate the embeddings in the needed format
