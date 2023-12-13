#!/usr/bin/env bash
# pfamScan_args.sh
# Usage: bash scripts/pfamScan.sh <hmmdb> <seqfile> 1>results/logs/pfamScan.log 2>results/logs/pfamScan.err

# <hmmdb> may be /work/courses/BINF6308/inputFiles/SampleDataFiles/Pfam-A.hmm
# <seqfile> may be results/trinity_de_novo.transdecoder_dir/longest_orfs.pep

hmmscan --cpu 4 --domtblout $1 $2 $3