#!/usr/bin/env bash

# Make directory if it does not exist
mkdir -p data

# (Optional) Remove the mac-vendor and mac-backup file to make a fresh one
rm -f data/mac-vendor.txt
rm -f data/mac-backup.txt

# Create a Backup File for MAC Addresses
touch data/mac-backup.txt

# Default hostnames
echo "Asustek Computer" >> data/mac-vendor.txt
echo "Intel Corporate" >> data/mac-vendor.txt
echo "Dell" >> data/mac-vendor.txt
