#!/usr/bin/env bash
# getNGS.sh

mkdir ../data

# Retrieve reads
vdb-config --prefetch-to-cwd
prefetch SRR22271830
fasterq-dump --split-3 SRR22271830

mv *.fastq ../data