#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1 # we need to exit with failure exit code
fi

echo "Installing nginx"

dnf install nginx -y

# check if installation is success or failure  with $?

if [ $? -ne 0 ]; then
    echo "Installing Nginx ... FAILURE"
    exit 1
else
    echo "Installing Nginx ... SUCCESS"
fi

echo "Installing mysql"

dnf install mysql -y

# check if installation is success or failure  with $?

if [ $? -ne 0 ]; then
    echo "Installing MySql ... FAILURE"
    exit 1
else
    echo "Installing MySql ... SUCCESS"
fi

echo "Installing nodejs"

dnf install nodejs -y

# check if installation is success or failure  with $?

if [ $? -ne 0 ]; then
    echo "Installing Nodejs ... FAILURE"
    exit 1
else
    echo "Installing Nodejs ... SUCCESS"
fi