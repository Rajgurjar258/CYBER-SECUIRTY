# CYBER-SECUIRTY
CYBER SECUIRTY NMAP PROJECT SS
# Nmap Bash Scanner

A simple, automated network reconnaissance tool using Nmap and Bash scripting.

![Nmap Bash Scanner](https://i.imgur.com/jlMePHI.png)

## Overview

This project is focused on automating network scanning tasks using Nmap (Network Mapper) and Bash scripting on Linux. It helps beginners understand how cybersecurity professionals gather information about computer networks, identify potential vulnerabilities, and create a basic automated tool.

## Features

- **User-Friendly Interface**: Simple command-line interaction
- **Multiple Scan Types**: Performs ping scans, port scans, and OS detection automatically
- **Organized Output**: Saves all scan results in a structured format
- **Progress Indicators**: Shows real-time scan progress
- **Timestamp-Based Filenames**: Prevents overwriting previous scan results

## Requirements

- Linux or macOS operating system
- Nmap installed
- Bash shell
- Root privileges (for full Nmap functionality)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/nmap-bash-scanner.git
   cd nmap-bash-scanner
   ```

2. Make the script executable:
   ```bash
   chmod +x scan.sh
   ```

3. Ensure Nmap is installed:
   - Ubuntu/Debian: `sudo apt-get install nmap`
   - CentOS/RHEL: `sudo yum install nmap`
   - macOS (with Homebrew): `brew install nmap`

## Usage

1. Run the script:
   ```bash
   sudo ./scan.sh
   ```

2. Enter the target IP address or domain name when prompted.

3. Wait for all scans to complete. The script will perform:
   - Ping scan (host discovery)
   - Full port scan
   - OS detection and service version scan

4. Check the results in the `results/` directory. Files are named in the format:
   ```
   [target]_[timestamp]_scan.txt
   ```

## Example

```bash
$ sudo ./scan.sh
===============================================
  _   _ __  __          _____   
 | \ | |  \/  |   /\   |  __ \  
 |  \| | \  / |  /  \  | |__) | 
 | . ` | |\/| | / /\ \ |  ___/  
 | |\  | |  | |/ ____ \| |      
 |_| \_|_|  |_/_/    \_\_|      
                               
 BASH SCANNER
===============================================

Welcome to Simple Nmap Bash Scanner
Enter the target IP or domain: example.com
Scanning host: example.com
Results will be saved in results/example.com_20230615_123045_scan.txt

Running Ping Scan...
✓ Ping Scan completed

Running Port Scan...
✓ Port Scan completed

Running OS Detection and Service Scan...
✓ OS Detection and Service Scan completed

All scans completed successfully!
Check the results file: results/example.com_20230615_123045_scan.txt
```

## Security and Ethical Considerations

**IMPORTANT**: This tool should only be used for:
- Scanning your own networks
- Networks you have explicit permission to scan
- Educational purposes in controlled environments

Unauthorized scanning of networks is illegal in many jurisdictions and can result in serious consequences.

## Project Structure

```
nmap-bash-scanner/
├── README.md        # This file (documentation)
├── scan.sh          # Main scanner script
├── results/         # Directory for scan results (created automatically)
├── LICENSE          # MIT License
```

## Future Improvements

- Add HTML report generation
- Implement email notifications
- Allow custom scan options
- Add vulnerability scanning capabilities
- Create a simple GUI interface

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
