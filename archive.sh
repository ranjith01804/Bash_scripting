#!/bin/bash
#input sholud be in sh <filename> <Source Path> <Backup path>
# Find and archive the top 10 disk usage files
set -x  # Enable debugging

SOURCE="$1"
BACKUP="$2"
archive_name="backup_$(date +%Y%m%d).tar.gz"

# Function to check if correct arguments are provided
check_args() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: $0 <source_directory> <backup_directory>"
        exit 1
    fi
}

# Ensure the backup directory exists
mkdir -p "$backup"

# Find top 10 disk usage files
find_archive(){
    IFS=$'\n'  # Handle filenames with spaces
    files=$(find "$1" -type f -exec du -sh {} + | sort -rh | head -10 | awk '{print $2}')
    # Archive the files
    echo "Archiving files..."
    tar -cvf "$2/$archive_name" $files && echo "Archive created successfully: $2/$archive_name"
}


# Run the script with proper flow
check_args "$@"
find_archive
