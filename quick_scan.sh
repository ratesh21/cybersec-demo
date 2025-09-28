#!/bin/bash
# quick_scan.sh - demonstration purposes only
TARGET="scanme.nmap.org"
nmap -sV -Pn $TARGET -oN nmap_scan.txt
nmap -sV --script=vuln $TARGET -oN nmap_vuln.txt