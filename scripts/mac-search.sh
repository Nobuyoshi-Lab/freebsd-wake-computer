#!/usr/bin/env bash
./default.sh

# -sP: Ping Scan
# -oN: Normal Output that will Stores inside the Given File Name
# tr -d '()': Remove Parentheses
sudo nmap -sP -oN data/nmap-orig-output.txt 192.168.1.* | \
	awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " " substr($0, index($0,$3))}' | \
	tr -d '()'  | sort -t . -k 4,4n > data/nmap-output.txt
cat data/nmap-output.txt

# Order:
# IP Address	MAC Address	MAC Vendor
# *Space Between
