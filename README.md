# cybersec-demo
# Nmap Scan — scanme.nmap.org
**Author:** Ratesh Kumar Khandei  
**Date:** 2025-09-28  
**Objective:** Quick reconnaissance and basic vulnerability mapping of a public test host for demonstration.

## Commands run
# (Optional) install nmap
sudo apt update && sudo apt install -y nmap

# Basic service & version discovery (save human-readable output)
nmap -sV -Pn scanme.nmap.org -oN nmap_scan.txt
## -sV : service/version detection
## -Pn : don't ping host (useful for remote targets)
## -oN : write normal output to file

# Quick script scan for common vulnerabilities (NSE vuln scripts)
nmap -sV --script=vuln scanme.nmap.org -oN nmap_vuln.txt
### --script=vuln : run vulnerability-related NSE scripts (safe on public test host)

# Full TCP port scan (all 65k ports) — optional, slower
nmap -p- -sV -Pn scanme.nmap.org -oN nmap_allports.txt

# Extract only open ports from the saved output
grep -E "open|filtered" nmap_scan.txt -n

# Show top lines of the scan (for embedding in report)
head -n 80 nmap_scan.txt

# (Optional) run a subset of NSE scripts for HTTP-specific checks
nmap -p 80 --script=http-enum,http-title -Pn scanme.nmap.org -oN nmap_http.txt
