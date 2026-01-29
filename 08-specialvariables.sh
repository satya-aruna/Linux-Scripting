#!/bin/bash

#### Special variables

echo "All arguments passed to the script: $@"
echo "Number of arguments passed: $#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Who is running the script: $USER"
echo "Home directory of current user: $HOME"
echo "Process Instance ID of the script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All arguments passed: $*"