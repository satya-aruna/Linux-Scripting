#!/bin/bash

USERID=$(id -u) # userid of root user 0, and others non-zero
LOGS_FOLDER="/var/log/linux-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access" | tee -a $LOGS_FILE
    exit 1 # we need to exit with failure exit code
fi

mkdir -p $LOGS_FOLDER

# Functions are not executed by default, only executed when called
VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 ... SUCCESS" | tee -a $LOGS_FILE
    fi
}

for pkg in $@
do
    echo "Installing $pkg ..." | tee -a $LOGS_FILE

    dnf install $pkg -y &>> $LOGS_FILE
    VALIDATE $? "Installing $pkg"  
done

