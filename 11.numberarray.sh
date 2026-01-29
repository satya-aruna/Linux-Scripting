#!/bin/bash

# 1. Create an array of numbers
numbers=(5 10 15 20 25)

echo "--- Array Information ---"
echo "All numbers: ${numbers[@]}"
echo "Number of elements: ${#numbers[@]}"

# 2. Access a specific element (the third element, index 2)
echo "The third number is: ${numbers[2]}" # Output: 15

# 3. Iterate through the array using a for loop
echo "--- Iterating through the array ---"
for num in "${numbers[@]}"; do
    echo "Value: $num"
done

# 4. Modify an element
numbers[0]=1 # Change the first element from 5 to 1
echo "First element after modification: ${numbers[0]}"