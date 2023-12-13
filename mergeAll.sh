#!/usr/bin/env bash
# mergeAll.sh
# Usage bash scripts/mergeAll.sh 1>results/logs/mergeAll.log 2>results/logs/mergeAll.err

ls results/bam/bsub.sorted.bam > data/bam/bamIn.txt

samtools merge -b data/bam/bamIn.txt data/bam/BsubAll.bam