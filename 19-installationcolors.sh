#!/bin/bash

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

# Functions are not executed by default, only executed when called
VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo -e "$R $2 ... FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$G $2 ... SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

for pkg in $@
do
    dnf list installed $pkg &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo -e "$B $pkg not installed. Installing now ... $N" | tee -a $LOGS_FILE

        dnf install $pkg -y &>> $LOGS_FILE
        VALIDATE $? "Installing $pkg"  
    else
        echo -e " $Y $pkg already installed ... SKIPPING $N" | tee -a $LOGS_FILE

    fi
done