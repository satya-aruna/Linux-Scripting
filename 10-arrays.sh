#!/bin/bash

# Array is a list of items

FRUITS=(Apple Banana Pear Guava)
echo "Fruits are: $FRUITS"
echo "Fruits are: ${FRUITS[@]}

ID=("101" "102" "103" "104" "105")
echo "IDs are: $ID"
echo "IDs are: ${ID[@]}