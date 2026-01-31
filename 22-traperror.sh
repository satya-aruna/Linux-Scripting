#!/bin/bash
# Trap generic errors
trap 'echo "An actual error occurred!"' ERR

# Avoid triggering the trap if no package matches
dnf list --installed $1 2>/dev/null || echo "Package not found, but script continues."