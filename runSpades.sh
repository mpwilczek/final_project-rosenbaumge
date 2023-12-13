#!/usr/bin/env bash
# runSpades.sh

mkdir -p "../results/bsub/"

function Spades {
	spades.py \
	-1 ../data/trimmed/paired/bsub.R1.paired.fastq \
	-2 ../data/trimmed/paired/bsub.R2.paired.fastq \
	-o ../results/bsub/
}
Spades