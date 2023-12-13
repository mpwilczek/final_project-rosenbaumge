#!/usr/bin/env bash
# sortBsub.sh
# Usage: bash scripts/sortBsub.sh 1>results/logs/sortBsub.log 2>results/logs/sortBsub.err &

alignedPath="results/sam/"
leftSuffix=".sam"

mkdir -p results/bam/

function sortAll {
    for leftInFile in $alignedPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$alignedPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        samtools sort \
		$alignedPath$sampleName$leftSuffix \
		-o results/bam/$sampleName.sorted.bam 
    done
}
sortAll