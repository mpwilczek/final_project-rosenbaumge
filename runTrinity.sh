#!/usr/bin/env bash
# runTrinity.sh
# Usage: bash scripts/runTrinity.sh 1>results/logs/trinity_guided.log 2>results/logs/trinity_guided.err &

mkdir -p results/trinity_guided
Trinity \
--genome_guided_bam data/bam/BsubAll.bam \
--genome_guided_max_intron 10000 \
--max_memory 10G --CPU 4 \
--output results/trinity_guided