#!/bin/bash
#
# Script: system_info.sh
# Purpose: Display comprehensive system information
# Author: Cloud Training
# Usage: ./system_info.sh [OPTIONS]
#

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
VERBOSE=0
OUTPUT_FILE=""
USE_COLORS=1

# Functions
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Display system information including hostname, uptime, memory, disk, and processes.

OPTIONS:
    -h, --help          Show this help message
    -v, --verbose       Show detailed information
    -o, --output FILE   Save output to file
    --no-color          Disable colored output

EXAMPLES:
    $0
    $0 --verbose
    $0 --output system_report.txt
    $0 -v -o report.txt

EOF
    exit 0
}

log_error() {
    echo -e "${RED}Error: $1${NC}" >&2
    exit 1
}

get_hostname() {
    hostname
}

get_uptime() {
    uptime -p 2>/dev/null || uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}'
}

get_load_average() {
    uptime | awk -F'load average:' '{print $2}'
}

get_memory_info() {
    if command -v free &> /dev/null; then
        free -h | grep Mem | awk '{printf "Total: %s, Used: %s, Free: %s, Available: %s", $2, $3, $4, $7}'
    else
        echo "Memory info not available"
    fi
}

get_disk_info() {
    df -h / | tail -1 | awk '{printf "Total: %s, Used: %s, Available: %s, Use%%: %s", $2, $3, $4, $5}'
}

get_top_processes() {
    ps aux --sort=-%cpu | head -6 | tail -5 | awk '{printf "%-8s %6s %5s%% %5s%% %s\n", $1, $2, $3, $4, $11}'
}

display_info() {
    local output_func=$1
    local label=$2
    
    if [ $USE_COLORS -eq 1 ]; then
        echo -e "${BLUE}${label}:${NC} $($output_func)"
    else
        echo "${label}: $($output_func)"
    fi
}

display_section() {
    local title=$1
    if [ $USE_COLORS -eq 1 ]; then
        echo -e "\n${GREEN}=== $title ===${NC}"
    else
        echo -e "\n=== $title ==="
    fi
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -v|--verbose)
            VERBOSE=1
            shift
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --no-color)
            USE_COLORS=0
            shift
            ;;
        *)
            log_error "Unknown option: $1. Use -h for help."
            ;;
    esac
done

# Main execution
main() {
    {
        display_section "System Information"
        display_info get_hostname "Hostname"
        display_info get_uptime "Uptime"
        display_info get_load_average "Load Average"
        
        display_section "Memory"
        display_info get_memory_info "Memory"
        
        display_section "Disk"
        display_info get_disk_info "Root Filesystem"
        
        if [ $VERBOSE -eq 1 ]; then
            display_section "Top Processes by CPU"
            echo "USER     PID    CPU%  MEM%  COMMAND"
            get_top_processes
        fi
        
        if [ $VERBOSE -eq 1 ]; then
            display_section "Additional Information"
            echo "Kernel: $(uname -r)"
            echo "Architecture: $(uname -m)"
            echo "OS: $(lsb_release -d 2>/dev/null | cut -f2 || uname -o)"
        fi
    } | if [ -n "$OUTPUT_FILE" ]; then
        tee "$OUTPUT_FILE"
    else
        cat
    fi
}

# Run main function
main

