#!/usr/bin/bash
#SBATCH --partition=short               # choose from debug, express, or short
#SBATCH --job-name=alignRNAseq
#SBATCH --time=01:00:00                 # the code pieces should run in far less than 1 hour
#SBATCH -N 1                            # nodes requested
#SBATCH -n 1                            # task per node requested
#SBATCH --output="batch-%x-%j.output"   # where to direct standard output; will be batch-jobname-jobID.output

# Usage: sbatch scripts/sbatch_AlignRNAseq.sh 
# Run from one above the scripts folder

echo "Starting our analysis $(date)"  

echo "Loading our BINF6308 Anaconda environment."
module load anaconda3/2021.11
source activate BINF-12-2021
echo "Loading GSNAP and Samtools."
module load gsnap/2021-12-17
module load samtools/1.10

echo "Make directory for log files"
mkdir -p results/logs/

echo "Build the reference genome $(date)"
bash scripts/bsubBuild.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-bsubBuild.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-bsubBuild.err

echo "Trim all reads in data/rawreads/ $(date)"
bash scripts/trimBsub.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trimBsub.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trimBsub.err

echo "Align the reads to the reference with GSNAP $(date)"
bash scripts/alignBsub.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-alignBsub.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-alignBsub.err

echo "Sort the resulting SAM files $(date)"
bash scripts/sortBsub.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-sortBsub.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-sortBsub.err

echo "Index the resulting BAM files $(date)"
bash scripts/indexBsub.sh 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-indexBsub.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-indexBsub.err

echo "Alignment complete $(date)"