#!/usr/bin/env bash
# alignPredicted_args.sh
# Usage: bash alignPredicated_args.sh <predicted proteins> <data base> 1>results/logs/alignPredicted_args.log 2>results/logs/alignPredicted_args.err

blastp -query $1 \
-db $2 \
-evalue 1e-10 \
-outfmt "6 qseqid sacc qlen slen length nident pident evalue stitle"