#!/bin/bash
Threshold=0

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
if [ "$cpu_usage" -gt "$Threshold" ]; then
    echo "High CPU usage detected: $cpu_usage%"
fi
