#!/bin/bash
count=1

while [ $count <= 5 ]
do
    echo "Count is: $count"
    sleep 1
    ((count++))
done