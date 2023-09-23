#!/bin/bash

# While loop

# The loop will run exactly 10 times.

i=1
while [[ $i -le 10 ]] ; do
   echo "$i"
  (( i += 1 ))
done

# For loop

# The loop will iterate 5 times

for i in {1..5}
do
    echo $i
done