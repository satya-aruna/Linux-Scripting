#!/bin/bash

START_TIME=$(date +%s) #date format in seconds

echo "Script started at: $START_TIME"

sleep 10

END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME)) # mathematical operation and command execution

echo "Script executed in $TOTAL_TIME seconds"