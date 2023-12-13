#!/usr/bin/env bash
# runQuast.sh

mkdir -p ../results/quast_results

function Quast {
	quast.py -o ../results/quast_results ../results/bsub/contigs.fasta
}
Quast