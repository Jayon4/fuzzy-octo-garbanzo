#!/bin/bash

# Ensure nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap is not installed. Please install it first (e.g., sudo apt install nmap)."
    exit 1
fi

# Prompt user to enter the subnet (e.g., 192.168.1.0/24)
read -p "Enter the subnet to scan (e.g., 192.168.1.0/24): " SUBNET

# Validate input
if [[ ! $SUBNET =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]]; then
    echo "Invalid subnet format. Please use CIDR notation (e.g., 192.168.1.0/24)."
    exit 1
fi

echo "Scanning for open port 3306 on subnet $SUBNET..."
nmap -p 3306 --open $SUBNET

# Optional: Save results to a file
read -p "Do you want to save the results to a file? (y/n): " SAVE_RESULTS
if [[ $SAVE_RESULTS == "y" || $SAVE_RESULTS == "Y" ]]; then
    OUTPUT_FILE="scan_results_3306.txt"
    nmap -p 3306 --open $SUBNET > $OUTPUT_FILE
    echo "Results saved to $OUTPUT_FILE"
fi

echo "Scan completed."
