#!/usr/bin/env bash
# trinityDeNovo.sh
# Usage: bash scripts/trinityDeNovo.sh 1>results/logs/trinity_de_novo.log 2>results/logs/trinity_de_novo.err

mkdir -p results/trinity_de_novo

# Get the list of left reads and store as $leftReads
leftReads="$(ls -q data/RNAseq/trimmed/paired/bsub.R1.paired.fastq)"

# Store echo of $leftReads as $leftReads to get rid of line breaks
leftReads=$(echo $leftReads)

# Replace spaces in the list of reads with comma
leftReads="${leftReads// /,}"
echo $leftReads

# Get the list of right reads and store as $rightReads
rightReads="$(ls -q data/RNAseq/trimmed/paired/bsub.R2.paired.fastq)"

# Store echo of $rightReads as $rightReads to get rid of line breaks
rightReads=$(echo $rightReads)

# Replace spaces in the list of reads with comma
rightReads="${rightReads// /,}"
echo $rightReads

Trinity \
--seqType fq \
--jaccard_clip \
--output results/trinity_de_novo \
--max_memory 10G --CPU 4 \
--left $leftReads \
--right $rightReads