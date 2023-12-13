#!/usr/bin/env bash
# BlastPep_args.sh
# Usage: bash scripts/blastPep.sh <query> <database> 1>results/blastPep.outfmt6 2>results/logs/blastPep.err

# here, you are using many sequences; each will be run and compared to swissprot db
# let's make sure to run with -outfmt 6.  *NOTICE we are now using blastp*

# <query> may be results/trinity_de_novo.transdecoder_dir/longest_orfs.pep 
# <database> may be /work/courses/BINF6308/inputFiles/blastDB/swissprot
blastp -query $1  \
    -db $2 \
    -max_target_seqs 1 \
    -outfmt 6 -evalue 1e-5 -num_threads 4 