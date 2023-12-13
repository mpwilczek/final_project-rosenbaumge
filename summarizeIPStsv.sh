#!/usr/bin/env bash
# summarizeIPStsv.sh
# Usage: bash summarizeIPStsv.sh <input IPS tsv> <output folder>

mkdir -p $2  # make the output folder if it doesn't exist

cut -f12,13 $1| sort | uniq -c | sort -k1 -rn >$2/domains.txt

cut -f14 $1 | \
perl -ne '@list=split/\|/, $_; foreach my $i (@list){ print "$i\n"; }' | \
sort | uniq -c | sort -k1 -rn >$2/go_ids.txt

cut -f15 $1 | \
perl -ne '@list=split/\|/, $_; foreach my $i (@list){ print "$i\n"; }' | \
sort | uniq -c | sort -k1 -rn >$2/path_ids.txt