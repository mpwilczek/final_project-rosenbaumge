#!/usr/bin/env bash
# trimBsub.sh
# Usage: bash scripts/trimBsub.sh 1>results/logs/trimBsub.log 2>results/logs/trimBsub.err &

fastqPath="data/RNAseq/"



# path to the Trimmomatic program folder within our environment that contains the Illumina adapters
# this is only for Discovery - local systems will typically have a path like: /usr/local/programs/Trimmomatic-0.39-2/
PATH_TO_TRIMMOMATIC="/shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2"

mkdir -p data/RNAseq/trimmed/paired 
mkdir -p data/RNAseq/trimmed/unpaired 

function trim {
    trimmomatic PE \
    -threads 1 -phred33 \
    data/RNAseq/SRR21276811_1.fastq \
    data/RNAseq/SRR21276811_2.fastq \
    data/RNAseq/trimmed/paired/bsub.R1.paired.fastq \
    data/RNAseq/trimmed/unpaired/bsub.R1.unpaired.fastq \
    data/RNAseq/trimmed/paired/bsub.R2.paired.fastq \
    data/RNAseq/trimmed/unpaired/bsub.R2.unpaired.fastq \
    HEADCROP:0 \
    ILLUMINACLIP:$PATH_TO_TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trim