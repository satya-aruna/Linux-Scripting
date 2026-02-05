#!/bin/bash
count=1

while (($count <= 5))
do
    echo "Count is: $count"
    sleep 1
    ((count++))
done

while [ $count -le 10 ]
do  
    echo "COunt is: $count"
    sleep 1
    ((count++))
done

while [ "$count" -lt 16 ]
do
    echo "COunt is: $count"
    sleep 1
    ((count++))
done

FILES_LIST=$(ls)

while IFS= read -r line; do
    echo "$line"
done <<< "$FILES_LIST"

while IFS= read -r line; do
    echo "Processing: $line"
done < "25-sourcingscript.sh"

