#!/usr/bin/env bash
./find-mac.sh

# For Backup Purpose
cat data/found-mac.txt >> data/mac-backup.txt
awk '!_[$0]++' data/mac-backup.txt > data/found-mac.txt
cat data/found-mac.txt > data/mac-backup.txt

# Convert text file (line-by-line) to an array called "DEVICE"
mapfile -t DEVICE < data/found-mac.txt

for a in "${DEVICE[@]}"
do
        sudo wake "$a"
        echo "Waked: $a"
done
