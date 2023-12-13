#!/usr/bin/env bash
# runIPS.sh
# Usage: bash scripts/runIPS.sh <input file> <output file>

mkdir -p results/logs

interproscan.sh --input $1 -o $2 --cpu 2 -f TSV -pa --goterms -dp  \
1> results/logs/scan.log 2>results/logs/scan.err