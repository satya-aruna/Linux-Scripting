#!/bin/bash

# Array is a list of items

FRUITS=(Apple Banana Pear Guava)

echo "Fruits are: ${FRUITS[@]}"
echo "Fruits count: ${#FRUITS[@]}"
echo "First fruit: ${FRUITS[0]}"
echo "Last fruit: ${FRUITS[((${#FRUITS[@]}-1))]}

ID=(101 102 103 104 105)
echo "IDs are:  ${ID[@]} "
