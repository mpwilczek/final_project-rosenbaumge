#!/usr/bin/env bash
# indexBsub.sh
# Usage: bash scripts/indexBsub.sh 1>results/logs/indexBsub.log 2>results/logs/indexBsub.err &

mkdir -p results/bam

sortedPath="results/bam/"
leftSuffix=".sorted.bam"

function indexAll {
    for leftInFile in $sortedPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$sortedPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        samtools index $sortedPath$sampleName$leftSuffix
    done
}
indexAll