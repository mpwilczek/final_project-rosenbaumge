#!/usr/bin/env bash
# alignBsub.sh
# Usage: bash scripts/alignAll.sh 1>results/logs/alignBsub.log 2>results/logs/alignBsub.err &

trimmedPairedPath="data/RNAseq/trimmed/paired/"
leftSuffix=".R1.paired.fastq"
rightSuffix=".R2.paired.fastq"

mkdir -p results/sam/

function alignAll {
    for leftInFile in $trimmedPairedPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$trimmedPairedPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        gsnap \
        -A sam \
        -D data \
        -d BSubtilis \
        -N 1 \
        $trimmedPairedPath$sampleName$leftSuffix \
        $trimmedPairedPath$sampleName$rightSuffix \
        1>results/sam/$sampleName.sam
    done
}
alignAll