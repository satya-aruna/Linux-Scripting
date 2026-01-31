#!/bin/bash
# Trap generic errors
trap 'echo "An actual error occurred!"' ERR

# Avoid triggering the trap if no package matches
dnf list installed $1 2>/dev/null || echo "Package not found, but script continues."
echo "Installing $1 ..."
dnf install $1 -y
if [ $? -eq 0 ]; then
    echo "$1 installed SUCCESSFULLY!!!"
else
    echo "$1 installation FAILED!!!"
fi