#!/usr/bin/env bash
# bsubBuild.sh
# Usage: bash scripts/bsubBuild.sh 1>results/logs/bsubBuild.log 2>results/logs/bsubBuild.err &

gmap_build -D data \
-d BSubtilis \
results/bsub/contigs.fasta