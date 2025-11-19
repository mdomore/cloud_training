#!/bin/bash
#
# Script: backup.sh
# Purpose: Create timestamped backups with retention policy
# Author: Cloud Training
# Usage: ./backup.sh SOURCE DEST [OPTIONS]
#

set -euo pipefail

# Configuration
RETENTION_DAYS=7
COMPRESS=true
VERBOSE=0

# Functions
usage() {
    cat << EOF
Usage: $0 SOURCE DEST [OPTIONS]

Create a timestamped backup of SOURCE directory to DEST.

ARGUMENTS:
    SOURCE          Source directory to backup
    DEST            Destination directory for backups

OPTIONS:
    -h, --help              Show this help message
    -r, --retention DAYS    Keep backups for N days (default: 7)
    --no-compress           Don't compress the backup
    -v, --verbose           Verbose output
    --verify                Verify backup integrity after creation

EXAMPLES:
    $0 /home/user /backups
    $0 /var/www /backups --retention 30
    $0 /data /backups --no-compress --verify

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

log_verbose() {
    if [ $VERBOSE -eq 1 ]; then
        log "VERBOSE" "$@"
    fi
}

verify_requirements() {
    if [ $# -lt 2 ]; then
        log_error "Missing required arguments"
        usage
    fi
    
    local source=$1
    local dest=$2
    
    if [ ! -d "$source" ]; then
        log_error "Source directory does not exist: $source"
        exit 1
    fi
    
    if [ ! -d "$dest" ]; then
        log_info "Creating destination directory: $dest"
        mkdir -p "$dest" || {
            log_error "Failed to create destination directory"
            exit 1
        }
    fi
}

create_backup() {
    local source=$1
    local dest=$2
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local source_name=$(basename "$source")
    local backup_name="${source_name}_${timestamp}"
    local backup_path="$dest/$backup_name"
    
    log_info "Starting backup of $source"
    log_verbose "Backup name: $backup_name"
    
    if [ "$COMPRESS" = true ]; then
        backup_path="${backup_path}.tar.gz"
        log_verbose "Creating compressed archive..."
        tar -czf "$backup_path" -C "$(dirname "$source")" "$(basename "$source")" || {
            log_error "Backup creation failed"
            exit 1
        }
    else
        log_verbose "Creating directory backup..."
        cp -r "$source" "$backup_path" || {
            log_error "Backup creation failed"
            exit 1
        }
    fi
    
    log_info "Backup created: $backup_path"
    
    # Get backup size
    local size=$(du -h "$backup_path" | cut -f1)
    log_info "Backup size: $size"
    
    echo "$backup_path"
}

verify_backup() {
    local backup_file=$1
    local source=$2
    
    log_info "Verifying backup integrity..."
    
    if [[ "$backup_file" == *.tar.gz ]]; then
        if tar -tzf "$backup_file" > /dev/null 2>&1; then
            log_info "Backup verification successful"
            return 0
        else
            log_error "Backup verification failed"
            return 1
        fi
    else
        # For directory backups, check if it exists and is readable
        if [ -d "$backup_file" ] && [ -r "$backup_file" ]; then
            log_info "Backup verification successful"
            return 0
        else
            log_error "Backup verification failed"
            return 1
        fi
    fi
}

cleanup_old_backups() {
    local dest=$1
    local source_name=$2
    
    log_info "Cleaning up backups older than $RETENTION_DAYS days..."
    
    local deleted=0
    while IFS= read -r backup; do
        if [ -n "$backup" ]; then
            log_verbose "Deleting old backup: $backup"
            rm -rf "$backup"
            deleted=$((deleted + 1))
        fi
    done < <(find "$dest" -name "${source_name}_*" -type f -mtime +$RETENTION_DAYS)
    
    if [ $deleted -gt 0 ]; then
        log_info "Deleted $deleted old backup(s)"
    else
        log_info "No old backups to delete"
    fi
}

# Parse arguments
SOURCE=""
DEST=""
VERIFY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            ;;
        -r|--retention)
            RETENTION_DAYS="$2"
            shift 2
            ;;
        --no-compress)
            COMPRESS=false
            shift
            ;;
        -v|--verbose)
            VERBOSE=1
            shift
            ;;
        --verify)
            VERIFY=true
            shift
            ;;
        -*)
            log_error "Unknown option: $1"
            usage
            ;;
        *)
            if [ -z "$SOURCE" ]; then
                SOURCE="$1"
            elif [ -z "$DEST" ]; then
                DEST="$1"
            else
                log_error "Too many arguments"
                usage
            fi
            shift
            ;;
    esac
done

# Verify requirements
verify_requirements "$SOURCE" "$DEST"

# Create backup
BACKUP_FILE=$(create_backup "$SOURCE" "$DEST")

# Verify if requested
if [ "$VERIFY" = true ]; then
    verify_backup "$BACKUP_FILE" "$SOURCE" || exit 1
fi

# Cleanup old backups
SOURCE_NAME=$(basename "$SOURCE")
cleanup_old_backups "$DEST" "$SOURCE_NAME"

log_info "Backup process completed successfully"

