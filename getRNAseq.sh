#!/usr/bin/env bash
# getRNAseq.sh

mkdir -p data/RNAseq/

prefetch SRR21276811
fasterq-dump --split-3 SRR21276811

mv *.fastq data/RNAseq