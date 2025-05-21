#!/bin/bash

set -x  # Enable debugging

SOURCE="$1"
BACKUP="$2"

# Function to check if correct arguments are provided
check_args() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: $0 <source_directory> <backup_directory>"
        exit 1
    fi
}

# Function to check if the backup directory exists, else create one
check_dir() {
    if [[ ! -d "$BACKUP" ]]; then
        echo "Creating directory $BACKUP"
        mkdir -p "$BACKUP"
    fi
}

# Function to find, compress, and move high-usage files
compress_file() {
    IFS=$'\n' # Set IFS to newline to prevent word splitting issues
    find "$SOURCE" -type f -name "*.txt" -exec du -h {} + | sort -rh | head -5 | awk '{print $2}' | while read -r file; do
        if [[ -f "$file" ]]; then
            gzip "$file" && mv "$file.gz" "$BACKUP"
            echo "Compressed and moved: $file.gz"
        fi
    done
    unset IFS # Reset IFS to default after use
}

# Run the script with proper flow
check_args "$@"
check_dir
compress_file

echo "Backup process completed!"
