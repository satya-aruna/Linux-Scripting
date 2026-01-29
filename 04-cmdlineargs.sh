#!/bin/bash

PERSON1=$1  # commandline arguments to script are stored in $1, $2 etc..
PERSON2=$2  # no space before and after =

# variables are referred with $ sign

echo "$PERSON1: Hello $PERSON2, How are you?"
echo "$PERSON2: Hi $PERSON1, I am fine. How about you?"
echo "$PERSON1: doing fine. What are you learning $PERSON2?"
echo "$PERSON2: I am learning shell. What about you?"