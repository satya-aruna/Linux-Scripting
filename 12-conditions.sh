#!/bin/bash

NUM=$1

if [ $NUM -gt 25 ]; then
    echo "Number is greater than 25"
elif [ $NUM -eq 25 ]; then
    echo "Number is equal to 25"
else 
    echo "Nuber is less than 25"