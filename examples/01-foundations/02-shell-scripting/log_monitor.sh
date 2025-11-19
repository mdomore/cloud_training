#!/bin/bash
#
# Script: log_monitor.sh
# Purpose: Monitor log files for specific patterns and alert on thresholds
# Author: Cloud Training
# Usage: ./log_monitor.sh [OPTIONS]
#

set -euo pipefail

# Configuration
LOG_FILE="${LOG_FILE:-/var/log/syslog}"
PATTERN="${PATTERN:-error}"
THRESHOLD="${THRESHOLD:-10}"
CHECK_INTERVAL="${CHECK_INTERVAL:-60}"
ALERT_EMAIL="${ALERT_EMAIL:-}"

# Functions
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Monitor log files for patterns and alert when threshold is exceeded.

OPTIONS:
    -f, --file FILE        Log file to monitor (default: /var/log/syslog)
    -p, --pattern PATTERN  Pattern to search for (default: error)
    -t, --threshold NUM    Alert threshold (default: 10)
    -i, --interval SEC     Check interval in seconds (default: 60)
    -e, --email EMAIL      Email address for alerts
    -h, --help             Show this help message

EXAMPLES:
    $0 --file /var/log/nginx/error.log --pattern "500" --threshold 5
    $0 --pattern "failed" --threshold 20 --interval 30

EOF
    exit 0
}

log() {
    local level=$1
    shift
    local message="$@"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message"
}

log_info() {
    log "INFO" "$@"
}

log_error() {
    log "ERROR" "$@" >&2
}

send_alert() {
    local count=$1
    local pattern=$2
    local message="Alert: Found $count occurrences of '$pattern' in last check interval"
    
    log_error "$message"
    
    if [ -n "$ALERT_EMAIL" ]; then
        echo "$message" | mail -s "Log Monitor Alert" "$ALERT_EMAIL" 2>/dev/null || true
    fi
}

check_log() {
    local file=$1
    local pattern=$2
    
    if [ ! -f "$file" ]; then
        log_error "Log file does not exist: $file"
        return 1
    fi
    
    # Count occurrences in last interval
    local count=$(grep -c "$pattern" "$file" 2>/dev/null || echo "0")
    echo "$count"
}

monitor_loop() {
    log_info "Starting log monitor"
    log_info "Log file: $LOG_FILE"
    log_info "Pattern: $PATTERN"
    log_info "Threshold: $THRESHOLD"
    log_info "Check interval: ${CHECK_INTERVAL}s"
    
    local last_position=$(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null || echo "0")
    
    while true; do
        local current_position=$(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null || echo "0")
        
        if [ "$current_position" -lt "$last_position" ]; then
            # Log file was rotated
            log_info "Log file was rotated, resetting position"
            last_position=0
        fi
        
        # Count new occurrences
        local count=$(tail -c +$((last_position + 1)) "$LOG_FILE" 2>/dev/null | grep -c "$PATTERN" || echo "0")
        
        if [ "$count" -gt 0 ]; then
            log_info "Found $count occurrence(s) of '$PATTERN'"
        fi
        
        if [ "$count" -ge "$THRESHOLD" ]; then
            send_alert "$count" "$PATTERN"
        fi
        
        last_position=$current_position
        sleep "$CHECK_INTERVAL"
    done
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -f|--file)
            LOG_FILE="$2"
            shift 2
            ;;
        -p|--pattern)
            PATTERN="$2"
            shift 2
            ;;
        -t|--threshold)
            THRESHOLD="$2"
            shift 2
            ;;
        -i|--interval)
            CHECK_INTERVAL="$2"
            shift 2
            ;;
        -e|--email)
            ALERT_EMAIL="$2"
            shift 2
            ;;
        *)
            log_error "Unknown option: $1"
            usage
            ;;
    esac
done

# Validate
if [ ! -r "$LOG_FILE" ]; then
    log_error "Cannot read log file: $LOG_FILE"
    exit 1
fi

# Start monitoring
monitor_loop

