#!/bin/bash

# Shell scripting simplifies automation by condensing a series of commands into a single file that can be executed all at once, eliminating the need for manually entering each command into the shell individually

# Preparing a script file

# 1) Create a file with '.sh' extension

# 2) In case you want the file to be executable, the first line of the script should be:
#   #!/bin/sh
#   Note: This is an exception to the rule that the character # is used to demark comments
#   Then make the script executable with:
#       chmod +x my_script.sh

# 3) Running a script

# For a non executable file
#   bash my_script.sh

# For an executable file
#   ./my_script.sh

echo Hello World

# To include other stripts inside another, you can use 'source' or '.':

source 1_Variables.sh