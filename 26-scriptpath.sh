#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

SCRIPT_DIR1=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Script directory name: $SCRIPT_DIR"

echo "Script directory name: $SCRIPT_DIR1"