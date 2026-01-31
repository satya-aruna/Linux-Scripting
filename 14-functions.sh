#!/bin/bash

USERID=$(id -u) # userid of root user 0, and others non-zero

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1 # we need to exit with failure exit code
fi

# Functions are not executed by default, only executed when called
VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

echo "Installing nginx"

dnf install nginx -y
VALIDATE("$?","Installing Nginx")

echo "Installing mysql"

dnf install mysql -y
VALIDATE("$?","Installing MySql")

echo "Installing nodejs"

dnf install nodejs -y
VALIDATE("$?","Installing Nodejs")
