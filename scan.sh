#!/bin/bash

# ===================================================================
# Nmap Bash Scanner - A simple tool for automated network reconnaissance
# ===================================================================

# Set colors for better visualization
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Print banner
echo -e "${CYAN}"
echo "==============================================="
echo "  _   _ __  __          _____   "
echo " | \ | |  \/  |   /\   |  __ \  "
echo " |  \| | \  / |  /  \  | |__) | "
echo " | . \` | |\/| | / /\ \ |  ___/  "
echo " | |\  | |  | |/ ____ \| |      "
echo " |_| \_|_|  |_/_/    \_\_|      "
echo "                               "
echo " BASH SCANNER"
echo "==============================================="
echo -e "${NC}"

# Check if Nmap is installed
if ! command -v nmap &> /dev/null; then
    echo -e "${RED}Error: Nmap is not installed. Please install Nmap first.${NC}"
    echo "On Debian/Ubuntu: sudo apt-get install nmap"
    echo "On CentOS/RHEL: sudo yum install nmap"
    echo "On macOS with Homebrew: brew install nmap"
    exit 1
fi

# Check if script is run with sudo (required for some Nmap features)
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}Warning: Not running as root. Some Nmap features might be limited.${NC}"
    echo -e "${YELLOW}Consider running with sudo for full functionality.${NC}"
    echo ""
fi

# Get target input
echo -e "${CYAN}Welcome to Simple Nmap Bash Scanner${NC}"
read -p "Enter the target IP or domain: " target

# Validate target input (simple check, could be enhanced)
if [ -z "$target" ]; then
    echo -e "${RED}Error: Target IP or domain cannot be empty.${NC}"
    exit 1
fi

# Create results directory if it doesn't exist
mkdir -p results

# Create a timestamp for the filename
timestamp=$(date +"%Y%m%d_%H%M%S")
filename="results/${target}_${timestamp}_scan.txt"

# Print scan information
echo -e "${GREEN}Scanning host: ${target}${NC}"
echo -e "${GREEN}Results will be saved in ${filename}${NC}"

# Write header to file
echo "=============================================" > $filename
echo "Nmap Scan Report for $target" >> $filename
echo "Scan started at $(date)" >> $filename
echo "=============================================" >> $filename

# Function to run a scan and show progress
run_scan() {
    scan_type=$1
    scan_command=$2
    
    echo -e "\n${YELLOW}Running $scan_type...${NC}"
    echo -e "\n=============================================" >> $filename
    echo "$scan_type - $(date)" >> $filename
    echo "=============================================" >> $filename
    
    # Show a simple spinner while the scan is running
    eval "$scan_command >> $filename &"
    scan_pid=$!
    
    spinner=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
    while kill -0 $scan_pid 2>/dev/null; do
        for i in "${spinner[@]}"; do
            echo -ne "\r${CYAN}$i ${scan_type} in progress...${NC}"
            sleep 0.1
        done
    done
    
    echo -e "\r${GREEN}✓ $scan_type completed${NC}"
}

# Run Ping Scan
run_scan "Ping Scan" "nmap -sn $target"

# Run Port Scan
run_scan "Port Scan" "nmap -p- $target"

# Run OS Detection and Service Scan
run_scan "OS Detection and Service Scan" "nmap -A $target"

# Scan complete
echo -e "\n${GREEN}All scans completed successfully!${NC}"
echo -e "${CYAN}Check the results file: ${filename}${NC}"

# Add footer to file
echo -e "\n=============================================" >> $filename
echo "Scan completed at $(date)" >> $filename
echo "=============================================" >> $filename
