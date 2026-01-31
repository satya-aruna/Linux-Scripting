#!/bin/bash

# sihals ERR when there is an error
# set -e # checks for errors while executing the script, if errors exits

# trap 'echo "There is an error in $LINENO, command: $BASH_COMMAND"' ERR

# color codes in Linux, can be enabled with echo -e option
R='\e[31m'
G='\e[32m'
Y='\e[33m'
B='\e[34m'
N='\e[0m'


USERID=$(id -u) # userid of root user 0, and others non-zero
LOGS_FOLDER="/var/log/linux-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1 # we need to exit with failure exit code
fi

mkdir -p $LOGS_FOLDER

for pkg in $@
do
    echo "Checking $pkg already exists..." | tee -a $LOGS_FILE
    # Avoid triggering the trap if no package matches
    # trap - ERR        # Disable the ERR trap
    dnf list installed $pkg &>> $LOGS_FILE
    STATUS=$?
    echo "status = $STATUS"
    if [ $STATUS -eq 1 ]; then
        echo -e "$B $pkg not installed. Installing now ... $N" | tee -a $LOGS_FILE
        dnf install $pkg -y &>> $LOGS_FILE   
    elif [ $STATUS -eq 0 ]; then
        echo -e " $Y $pkg already installed ... SKIPPING $N" | tee -a $LOGS_FILE
    else
        echo "DNF encountered a real error (Code: $STATUS)."
        exit $STATUS
    fi
    # trap 'echo "There is an error in $LINENO, command: $BASH_COMMAND"' ERR

done