#!/usr/bin/env bash

# Get MAC Vendors from the mac-vendor.txt (Inputted by user)
mapfile -t VENDOR < data/mac-vendor.txt

# Get MAC Address from nmap-output.txt by
# filtering the MAC Vendors inside found-mac.txt.
for a in "${VENDOR[@]}"
do
        awk -v vendor="$a" '
        $0 ~ vendor {print $2}
        ' data/nmap-output.txt >> data/found-mac.txt
done
