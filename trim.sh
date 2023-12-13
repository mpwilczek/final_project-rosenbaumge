#!/usr/bin/env bash
# trim.sh

mkdir -p ../data/trimmed/paired 
mkdir -p ../data/trimmed/unpaired 

PATH_TO_TRIMMOMATIC="/shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2"
function trim {
	trimmomatic PE \
	-threads 1 -phred33 \
	../data/SRR22271830_1.fastq \
	../data/SRR22271830_2.fastq \
	../data/trimmed/paired/bsub.R1.paired.fastq \
	../data/trimmed/unpaired/bsub.R1.unpaired.fastq \
	../data/trimmed/paired/bsub.R2.paired.fastq \
	../data/trimmed/unpaired/bsub.R2.unpaired.fastq \
	HEADCROP:0 \
	ILLUMINACLIP:$PATH_TO_TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
	LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trim