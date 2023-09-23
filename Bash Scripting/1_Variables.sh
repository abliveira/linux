#!/bin/bash

# In Bash, you can use and set the variable values in the following ways:

# Assign the value directly. Do not user spaces, our the variable will be mistaken with a command

text='Hello World from 1_Varibles.sh'

# To access the value of a variable, use $

echo $text

# Variable naming conventions

# Start with a letter or an underscore (_)
# Can contain letters, numbers, and underscores (_)
# Names are case-sensitive
# Names should not contain spaces or special characters
# Avoid using reserved keywords, such as if, then, else, fi

# There are some special environment variables that can be used inside a script:

# $0        command name
# $1 $2 ... command arguments
# $*        represents them all
# $@        represents them all, preserving the grouping of quoted arguments
# $#        number of arguments

# Note that you should often enclose these variables in double quotes; i.e. you should say "$@" to preserve the argument grouping

# In addition, you will get syntax errors when doing comparisons if the string is empty if you do not use double quotes

echo 0 = $0
echo 1 = $1
echo ’*’ = $*

# Running the script with the command
#   ./Environment_Variables.sh a b c d e
#
# The output will be:
#   0 = ./foobar
#   1 = a 
#   '*' = abcde

# To retrieve a value from an external command, use backticks (``)
echo `date`

# Is even possible to use the command's options
echo `date +"%T"`

# Read a input
echo -e "\nWhats your name?"
read name
echo "Hello "$name

# Read a file
echo -e "\nReading 1_Variables_input.txt"
while read line
do
  echo $line
done < 1_Variables_input.txt