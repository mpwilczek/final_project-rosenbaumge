#!/usr/bin/env bash
# predictProteins_args.sh
# Usage: bash scripts/predictProteins.sh <transcriptome> <result folder> 1>results/logs/predictProteins.log 2>results/logs/predictProteins.err

# <transcriptome> may be data/trinity_de_novo/Trinity.fasta
# <results folder> may be results/trinity_de_novo.transdecoder_dir 
TransDecoder.Predict \
    -t $1 \
    -O $2 \
    --retain_pfam_hits $3 \
    --retain_blastp_hits $4