#!/bin/bash

# Define the URL and backup directory
URL="https://IP:23371/ef/zipfiles/images.zip"
BACKUP_DIR="./backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get the current date and time for timestamping the backup
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$BACKUP_DIR/images_$TIMESTAMP.zip"

# Log file to record the script's activities
LOG_FILE="$BACKUP_DIR/backup_log_$TIMESTAMP.txt"

# Start logging
echo "Starting backup process at $(date)" > "$LOG_FILE"

# Download the file using wget
echo "Downloading file from $URL to $OUTPUT_FILE" >> "$LOG_FILE"
wget "$URL" -O "$OUTPUT_FILE" >> "$LOG_FILE" 2>&1

# Check if wget succeeded and log the result
if [ $? -eq 0 ]; then
    echo "Download successful: $OUTPUT_FILE" >> "$LOG_FILE"
else
    echo "Download failed." >> "$LOG_FILE"
    exit 1
fi

# End logging
echo "Backup process completed at $(date)" >> "$LOG_FILE"
