#!/bin/bash
# Log rotations script: Archive the logs older than a specified number of days.

mkdir -p /root/logs/archive1

find /root/logs -type f -name "*.log" -mtime +3 |while read -r Logfile; do
    gzip "$Logfile"
done
mv /root/logs/*.log.gz /root/logs/archive/
echo "Log rotation completed: Archived logs older than 3 days."
