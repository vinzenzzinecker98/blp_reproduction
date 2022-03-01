cd blp

#Freebase
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=06:00:00 --mem-per-gpu=5000mb --job-name=freebase_transe --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_TransE_DistilBERT.txt scripts/blp-transe-fb15k237.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=06:00:00 --mem-per-gpu=5000mb --job-name=freebase_distmult --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_DistMult_DistilBERT.txt scripts/blp-distmult-fb15k237.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=06:00:00 --mem-per-gpu=5000mb --job-name=freebase_complex --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_ComplEx_DistilBERT.txt scripts/blp-complex-fb15k237.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=06:00:00 --mem-per-gpu=5000mb --job-name=freebase_simple --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_SimplE_DistilBERT.txt scripts/blp-simple-fb15k237.sh

#Wordnet
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=03:00:00 --mem-per-gpu=5000mb --job-name=wordnet_transe --output=/pfs/data5/home/kit/stud/ucgvm/output_WN_TransE_DistilBERT.txt scripts/blp-transe-wn18rr.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=03:00:00 --mem-per-gpu=5000mb --job-name=wordnet_complex --output=/pfs/data5/home/kit/stud/ucgvm/output_WN_ComplEx_DistilBERT.txt scripts/blp-complex-wn18rr.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=03:00:00 --mem-per-gpu=5000mb --job-name=wordnet_distmult --output=/pfs/data5/home/kit/stud/ucgvm/output_WN_DistMult_DistilBERT.txt scripts/blp-distmult-wn18rr.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=03:00:00 --mem-per-gpu=5000mb --job-name=wordnet_simple --output=/pfs/data5/home/kit/stud/ucgvm/output_WN_SimplE_DistilBERT.txt scripts/blp-simple-wn18rr.sh

#wikidata
sbatch --gres=gpu:8 --nodes=1 --partition=gpu_8 --ntasks=1 --time=48:00:00 --mem-per-gpu=94000mb --job-name=wikidata_transe --output=/pfs/data5/home/kit/stud/ucgvm/output_Wikidata5m_TransE_DistilBERT.txt scripts/blp-transe-wikidata5m.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=15:00:00 --mem-per-gpu=10000mb --job-name=wikidata_simple --output=/pfs/data5/home/kit/stud/ucgvm/output_Wikidata5m_SimplE_DistilBERT.txt scripts/blp-simple-wikidata5m.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=15:00:00 --mem-per-gpu=10000mb --job-name=wikidata_distmult --output=/pfs/data5/home/kit/stud/ucgvm/output_Wikidata5m_distmult_DistilBERT.txt scripts/blp-distmult-wikidata5m.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=15:00:00 --mem-per-gpu=10000mb --job-name=wikidata_complex --output=/pfs/data5/home/kit/stud/ucgvm/output_Wikidata5m_complex_DistilBERT.txt scripts/blp-complex-wikidata5m.sh



#sbert
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=10:00:00 --mem-per-gpu=5000mb --job-name=sbertFB --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_TransE_SentenceBERT.txt scripts/sbert-transe-fb15k237.sh
sbatch --gres=gpu:2 --nodes=1 --partition=gpu_4 --ntasks=1 --time=8:00:00 --mem-per-gpu=5000mb --job-name=sbertWN --output=/pfs/data5/home/kit/stud/ucgvm/output_wn18rr_TransE_SentenceBERT.txt scripts/sbert-transe-wn18rr.sh

#onlylinear
sbatch --gres=gpu:1 --nodes=1 --partition=gpu_4 --ntasks=1 --time=4:00:00 --mem-per-gpu=5000mb --job-name=linear_FB --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_TransE_LinearSBERT.txt scripts/linear_sbert_transe_FB.sh
sbatch --gres=gpu:1 --nodes=1 --partition=gpu_4 --ntasks=1 --time=3:00:00 --mem-per-gpu=5000mb --job-name=Linear_WN --output=/pfs/data5/home/kit/stud/ucgvm/output_wn18rr_TransE_LinearSBERT.txt scripts/linear_sbert_transe_WN18RR.sh

#gridsearch
sbatch --gres=gpu:1 --nodes=1 --partition=gpu_4 --ntasks=1 --time=30:00:00 --mem-per-gpu=10000mb --job-name=gridsearch --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_TransE_LinearSBERT_GRIDSEARCH.txt scripts/grid_search.sh

#wiki2vec
sbatch --gres=gpu:1 --nodes=1 --partition=gpu_4 --ntasks=1 --time=06:00:00 --mem-per-gpu=5000mb --job-name=wiki2vec_test --output=/pfs/data5/home/kit/stud/ucgvm/output_FB_TransE_Wiki2vec.txt scripts/wiki2vec-bow-transe-fb15k237.sh