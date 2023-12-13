#!/usr/bin/env bash
# prepareForIPS.sh

head -$1 $2 | sed 's/*//g' > $3