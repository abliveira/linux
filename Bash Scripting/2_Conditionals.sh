#!/bin/bash

# Remember to put spaces around the [ ] brackets.

# Integer comparison

# -eq : is equal to

# if [ "$a" -eq "$b" ]

# -ne : is not equal to

# if [ "$a" -ne "$b" ]

# -gt : is greater than

# if [ "$a" -gt "$b" ]

# -ge : is greater than or equal to

# if [ "$a" -ge "$b" ]

# -lt : is less than

# if [ "$a" -lt "$b" ]

# -le : is less than or equal to

# if [ "$a" -le "$b" ]

# < : is less than (within double parentheses)

# (("$a" < "$b"))

# <= : is less than or equal to (within double parentheses)

# (("$a" <= "$b"))

# > : is greater than (within double parentheses)

# (("$a" > "$b"))

# >= : is greater than or equal to (within double parentheses)

# (("$a" >= "$b"))

echo "Enter a number: "
read number

if [ $number -gt 0 ]; then
  echo "$number is positive"
elif [ $number -lt 0 ]; then
  echo "$number is negative"
else
  echo "$number is zero"
fi

# string comparison

# = or == : is equal to

# if [ "$a" = "$b" ] or # if [ "$a" == "$b" ]

# != : is not equal to

# if [ "$a" != "$b" ]

# < : is less than, in ASCII alphabetical order

# if [[ "$a" < "$b" ]]

# if [ "$a" \< "$b" ]

# Note that the "<" needs to be escaped within a [ ] construct

# > : is greater than, in ASCII alphabetical order

# if [[ "$a" > "$b" ]]

# if [ "$a" \> "$b" ]

# Note that the ">" needs to be escaped within a [ ] construct

# -z : string is null, that is, has zero length

String=''   # Zero-length ("null") string variable.

if [ -z "$String" ]
then
  echo "\$String is null."
else
  echo "\$String is NOT null."
fi     # $String is null.

# -n : string is not null

# if [ -n "$string1" ]

# Note: requires that the string be quoted

# Case

fruit="apple"

case $fruit in
    "apple")
        echo "This is a red fruit."
        ;;
    "banana")
        echo "This is a yellow fruit."
        ;;
    "orange")
        echo "This is an orange fruit."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac