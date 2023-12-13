#!/bin/bash
#SBATCH --partition=short
#SBATCH --job-name=assembleGenome
#SBATCH --time=04:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --output="batch-%x-%j.output"

echo "Starting analysis on $(date)"

ORGANISM="B. subtilis"
SRR_ID=SRR22271830

echo "$ORGANISM SRR reads to process: $SRR_ID"

echo "Loading BINF6308 Anaconda environment."
module load anaconda3/2021.11
source activate BINF-12-2021

echo "Downloading $SRR_ID reads on $(date)"
bash getNGS.sh

echo "$SRR_ID trimmed reads read on $(date)"
bash trim.sh 

echo "Trimmed $SRR_ID genome reads analyzing on $(date)"
bash runSpades.sh 

echo "Genome assembly beginning on $(date)"
bash runQuast.sh

echo "Completed on $(date)"