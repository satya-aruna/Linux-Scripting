#!/bin/bash

R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
N='\e[0m'

LOG_DIR=/home/ec2-user/app-logs
LOG_FILE="$LOGDIR/$0.log"

# Check if the directory exists

if [ ! -d LOG_DIR ]; then
    echo  "$LOG_DIR does not exist" 
    exit 1
fi

FILES_TO_DELETE=$(find $LOG_DIR -name "*.log" -mtime +14)
echo "$FILES_TO_DELETE"
