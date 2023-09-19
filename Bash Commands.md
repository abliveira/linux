# Terminal Environment

## Commands

### clear

Clear the terminal completely

```bash
clear
```

Clear only the visible content, keeping the scrollback buffer

```bash
clear -x
```

or

    ctrl + L

### alias

Aliases permits custom definitions. Typing alias with no arguments gives the list of defined aliases. unalias gets rid of an alias.

```bash
alias l=’ls -laF’
```

```bash
alias dir=’ls -latF’
```

```bash
alias rm=’rm -i’
```

```bash
alias atualiza='sudo apt-get update && sudo apt-get upgrade'
```

### & operator

With & the process starts in the background, so you can continue to use the shell and do not have to wait until the script is finished. If you forget it, you can stop the current running process with Ctrl-Z

**Example**

Opens firefox, but keeps the shell available
```bash
firefox &
```

## Navegation

### cd

go to the root directory

```bash
cd
```

go to the directory

```bash
cd <directory>
```

move one directory up
```bash
cd ..
```

move to your previous directory

```bash
cd -
```

### ls

List files in the current directory
```bash
ls
```

List all the files in the sub-directories as well
```bash
ls -R
```

List all files, even the hidden files
```bash
ls -a
```

List the files and directories with detailed information like the permissions, size, owner, etc.
```bash
ls -al
```

List files with sizes
```bash
ls -lh
```

In the output of a detailed ls command, such as -al or -lh, the first character in the listing shows the type of file

|Character  |Type  |
|---------|---------|
|Normal File     |-        |
|Directory     |d         |
|Symbolic link     |l         |
|Named pipe (FIFO)     |p         |
|Unix domain socket     |s         |
|Block device node     |b         |
|Character device node     |c         |

### tree

Shows a visual tree of files and directories hierachy

Not installed by default. Must be installed using:

```bash
sudo apt-get install tree 
```

Displays a visual tree of all files and directories above the current

```bash
tree
```

Displays a visual tree above the directory, limiting the depth

```bash
tree -L <max_depth>
```

# Files

## Text output

### cat

Used to viewing file contents

```bash
cat <filename>
```

Combine contents of multiple files

```bash
cat file1 file2
```

Combine multiple files and save the output into a new file

```bash
cat file1 file2 > newfile
```

Append a file to the end of an existing file

```bash
cat file >> existingfile
```

Any subsequent lines typed will go into the file, until Ctrl-D is typed

```bash
cat > file
```

Any subsequent lines are appended to the file, until Ctrl-D is typed

```bash
cat >> file
```

The tac command prints the lines of a file in reverse order. Each line remains the same, but the order of lines is inverted. The syntax of tac is the same as for cat

```bash
tac file
```

or

```bash
tac file1 file2 > newfile
```

### echo

can be used to display a string on standard output, like variables

The specified string is placed in a new file

```bash
echo string > newfile
```

The specified string is appended to the end of an already existing file

```bash
echo string >> existingfile
```

The contents of the specified environment variable are displayed

```bash
echo $variable
```

### tee

reads standard input (stdin) and writes it to both standard output (stdout) and one or more files. Works as `> newfile_name`, but with more options

```bash
[command] | tee [options] [filename]
```

**Example**

List the contents of a directory on the screen and save the output to a file

```bash
ls -l | tee newfile
```

### less

Displays the content of a file partially and allows for easy navigation through the text. Keeps the terminal clean and loads files quickly, as it only loads the current text on the screen

```bash
less <filename>
```

### head

Look at the beginning of the file. By default, outputs the first 10 lines

```bash
head <filename>
```

To display the **n** first lines:

```bash
head -n <number of lines> <filename>
```

### tail

Same as head, but outputs the last lines of the file. By default, outputs the last 10 lines

```bash
tail <filename>
```

To display the **n** last lines:

```bash
tail -n <number of lines> <filename>
```

### strings

Looks for printable strings in a file. A string is any sequence of 4 or more printable characters that end with a new-line or a null character. Useful in locating human-readable content embedded in binary files

Show the printable content of a file

```bash
strings <filename>
```

Filtering the result with grep

```bash
strings <filename> | grep <search_string>
```

## Text manipulation

### sed

useful to make substitutions and other modifications in files and in streamed output.

Substitute first string occurrence in every line and displays it

```bash
sed s/pattern/replace_string/ file
```

or

```bash
sed s:pattern:replace_string: file
```

Substitute all string occurrences in every line

```bash
sed s/pattern/replace_string/g file
```

Substitute all string occurrences in a range of lines

```bash
sed 1,3s/pattern/replace_string/g file
```

Save changes for string substitution in the same file. use the -i option with care, because the action is not reversible

```bash
sed -i s/pattern/replace_string/g file
```

Save changes into a new file

```bash
sed s/pattern/replace_string/g file > newfile

sed s/pattern/replace_string/g < file > newfile

cat file | sed s/pattern/replace_string/g > newfile
```

If you want to make multiple simultaneous substitutions, you need to use the **-e** option, as in:

```bash
$ sed  -e s/"pig"/"cow"/g -e s/"dog"/"cat"/g < file > newfile
```

and you can work directly on streams generated from commands, as in:

```bash
$ echo hello | sed s/"hello"/"goodbye"/g

goodbye
```

If you have a lot of commands, you can put them in a file and apply the **-f** option, as in:

```bash
$ cat scriptfile

s/pig/cow/g

s/dog/cat/g

s/frog/toad/g

$ sed  -f scriptfile < file > newfile
```

Additionally, you can invoke sed using commands

Specify editing commands at the command line, operate on file and put the output on standard out (e.g. the terminal)

```bash
sed -e command <filename>
```

Specify a scriptfile containing sed commands, operate on file and put output on standard out

```bash
sed -f scriptfile <filename>
```

The -e command option allows you to specify multiple editing commands simultaneously at the command line. It is unnecessary if you only have one operation invoked.

### tr

Deletes or substitutes characters from standard input and writes the result to standard output. It can't read a file directly, so it is often used with pipes (|) and redirects (>>)

```bash
tr [options] set1 [set2]
```

**Examples**

Translate braces into brackets, type:

```bash
tr '{}' '\[]' < textfile > newfile
```

Translate lowercase characters to uppercase

```bash
tr 'a-z' 'A-Z' < textfile > newfile
```

or

```bash
cat linux.txt | tr [:lower:] [:upper:] > output.txt
```

**SET**

Represents strings of characters. The command accepts the following interpreted sequences for character matching:

|Sequence  |Interpretation  |
|---------|---------|
| \NNN    | Characters with the NNN octal value (1 to 3 octal digits)
| \\    | Backslash        |
| \a    | An audible bell character        |
| \b | Backspace |
| \f | Form feed |
| \n | Newline character |
| \r | Return character |
| \t | Horizontal tab |
| \v | Vertical tab |
| CHAR1-CHAR2 | All characters from CHAR1 to CHAR2 in an ascending order |
| [CHAR*] | Copies CHAR* in SET2 up to the length of SET1 |
| [CHAR*REPEAT] | Repeats copies of CHAR Repeats octal if starting with 0 |
| [:alnum:] | All letters and digits |
| [:alpha:] | All letters |
| [:blank:] | Horizontal whitespaces |
| [:cntrl:] | All control characters |
| [:digit:] | All digits |
| [:graph:] | Printable characters, excluding space |
| [:lower:] | All lowercase characters |
| [:print:] | Printable characters, including space |
| [:punct:] | All punctuation characters |
| [:space:] | Horizontal or vertical whitespace characters |
| [:upper:] | All uppercase letters |
| [:xdigit:] | Hexadecimal digits |
| [=CHAR=]	 |  characters equivalent to CHAR |

### sort and uniq

Sort the lines in the specified file, according to the characters at the beginning of each line

```bash
sort <filename>
```

uniq removes duplicate consecutive lines in a text file and is useful for simplifying the text display.

To remove duplicate entries from multiple files at once:

```bash
sort file1 file2 | uniq > file3

sort -u file1 file2 > file3
```

### paste, join and split

used to combine fields from different files, using a tab as default

To paste contents from two files:

```bash
paste file1 file2
```
The syntax to use a different delimiter:

```bash
paste -d, file1 file2
```

**Example**

```bash
$ cat animal
Mammal
Reptile

$ cat species
Elephant
Snake

$ paste animal species
Mammal	Elephant
Reptile	Snake
```

To combine two files on a common field, we can join file1 file2

```bash
join file1.txt file2.txt 
```

**Example**

```bash
$ cat foodtypes.txt
1 Protein
2 Carbohydrate
3 Fat

$ cat foods.txt
1 Cheese
2 Potato
3 Butter
```

These files share a join field as the first field and can be joined.

```bash
$ join foodtypes foods.txt
1 Protein Cheese
2 Carbohydrate Potato
3 Fat Butter
```

To split large files into smaller files

```bash
split file.txt
```

by default it splits the files into 1000 lines per file

Split file based on number of lines.

```bash
split -l <number_of_lines> file.txt <split_file_prefix>
```

### wc

Counts the number of lines, words, and characters in a file or list of files
Option

```bash
wc [options] [file]
```

**–l**    Displays the number of lines

**-c**    Displays the number of bytes

**-w**    Displays the number of words

**Example**

Counts only in header files

```bash
wc *.h
```

## Files manipulation

### rm

Remove files

```bash
rm <filename>
```

remove an empty directory  

```bash
rm -d dirname ou rmdir dirname
```

remove non-empty directories and all the files within them

```bash
rm -r dirname
```

### mv

Used for move and rename

Move o arquivo do diretório atual para o diretório especificado

```bash
mv file.txt /home/username/Pictures
```

Rename a file or folder

```bash
mv <filename> <new_filename>
```

move a file to a subfolder

```bash
mv file1 folder1
```

move a file to upperfolder

```bash
mv file1 ..
```

### cp

Copia o arquivo do diretório atual para o diretório especificado

```bash
cp file.txt /home/username/Pictures 
```

### mkdir

Create directories

```bash
mkdir Music/Newfile
```

### rmdir

Remove directories

### file

Show file types

### ln

Create symbolic and hard links

### touch

Either create an empty file, or update the file modification time

Creates the file

```bash
touch "arquivo.txt"
```

### wc

Count lines, words, and bytes in a file

## Search

### Find

Used for locating files based on their properties, including name. It does not search the content

The general form of the command is:

```bash
find [location] [criteria] [actions]
```

where there are three classes of arguments, each of which may be omitted. If no location is given, the current directory **(.)** is assumed; if no criteria are given, all files are displayed; and, if no actions are given, only a listing of the names is given.

There are many logical expressions which can be used for criteria. For example:

```bash
find /etc -name  "*.conf"
```

will print out the names of all files in the **/etc** directory and its descendants, recursively, that end in **.conf**. To specify a simple action request:

```bash
find /etc -name  "*.conf"  -ls
```

will print out a long listing, not just the names.

A more complicated example:

```bash
find /tmp /etc -name  "*.conf"  -or  -newer /tmp/.X0-lock  -ls
```

will look in subdirectories under **/etc** and **/tmp** for files whose names end in **.conf**, or are newer than **/tmp/.X0-lock** and print out a long listing.

You can perform actions with the **-exec** option, as in:

```bash
find . -name  "*~"  -exec  rm {} ’;’
```

where **.** is used to specify the starting directory for the search, which in this context, it represents the current directory. **{}** is a fill in for the files to be operated on, and **’;’** indicates the end of the command. This can be unwieldy and one often pipes into the **xargs** program, as in:

```bash
find . -name  "*~" | xargs rm
```

which accomplishes the same action. A third way to do the same action would be:

```bash
for names in  $(find . -name "*~" ) ; do  rm  $names ; done
```

If a filename has a blank space in it (or some other special characters), some of the previous commands will fail.

It is generally a disfavored practice to utilize such file names in UNIX-like operating systems, but it is not uncommon for such files to exist, either in files brought in from other systems, or from applications which are also used in other systems.

In such a case, the following variant will work just fine:

```bash
find . -name  "*~"  -print0 | xargs -0  rm
```

as will the command that uses **-exec rm {} ’;’**.

There are many options to **find**, especially regarding selection of files to display. This can be done based on size, time of creation or access, type of file, owner, etc. A quick synopsis is provided by **find --help**:

### Grep

Search for a pattern in a file and print all matching lines

```bash
grep [pattern] <filename>
```

Can be used to filter a command, such as

```bash
| grep May
```

It will show only line with the content

```bash
ls -l *.ps | grep May
```

Search all files on directories recursively

```bash
grep -r [pattern] <filename>
```

Show results also from non text files, such binaries

```bash
grep -a [pattern] <filename>
```

Print all lines that do not match the pattern

```bash
grep -v [pattern] <filename> 
```

Print the lines that contain the numbers 0 through 9

```bash
grep [0-9] <filename>
```

Print context of lines (specified number of lines above and below the pattern) for matching the pattern; here, the number of lines is specified as 3

```bash
grep -C 3 [pattern] <filename>
```

some of the most important options are:

**-i**     Ignore case

**-v**    Invert match

**-n**    Print line number

**-H**    Print filename

**-a**    Treat binary files as text

**-I**    Ignore binary files

**-r**    Recurse through subdirectories

**-l**    Print out names of all files that contain matches

**-L**    Print out names of all files that do not contain matches

**-c**    Print out number of matching lines only

**-e**    Use the following pattern; useful for multiple strings and special characters

**Examples**

search all files in the current directory and those below it for the strings "pig" or "dog", ignoring case

```bash
grep  -i  -e pig -e dog -r .
```

print all lines that end with "dog"

```bash
grep  "dog$" file
```

print all lines that end with "dog"

```bash
grep d[a-p] file
```

print all lines that start with "dog"

```bash
grep  "^dog" file
```

Find all entries in **/etc/services** that include the string **ftp** and restrict to those that use the **tcp** protocol:

```bash
grep ftp /etc/services | grep tcp
```

## File Compression

bunzip2, bzcat, bdiff, bzip2, bzless

gunzip, gzexe, gzip, zcat, zless

zip, upzip

xz, unxz, xzcat

## Viewing Compressed Files

When working with compressed files, many standard commands cannot be used directly

To view a compressed file

```bash
zcat compressed-file.txt.gz
```

To page through a compressed file

```bash
zless somefile.gz 

zmore somefile.gz
```

To search inside a compressed file

```bash
zgrep -i less somefile.gz
```

To compare two compressed files

```bash
zdiff file1.txt.gz file2.txt.gz
```

Note that if you run zless on an uncompressed file, it will still work and ignore the decompression stage. There are also equivalent utility programs for other compression methods besides gzip.

For example, we have bzcat and bzless associated with bzip2, and xzcat and xzless associated with xz.

## File Ownership, Permissions and Attributes

attr, chgrp, chown, chmod

Files

awk, basename, cat, col, cp, cpio, csplit, cut, dd, diff, dirname, egrep, expand, file, fgrep, fmt, grep, head, join, less, more, sed, tail, tar

Filesystem

cd, chroot, df, dirs, du, fdisk, fsck, fuser, ln, ls, mkdir, mv, pushd, popd, rm, rmdir

## Permissions

### chgrp

The root user account can change the group assigned to a file or directory by using the chgrp command.

**Example**

```bash
chgrp staff file1.txt

chgrp –R staff /home/john
```

• -R : recursively changes the group of all files under the specified directory.

### chmod

The root user account or the owner of the file or directory can change the assigned permissions by using the chmod command

**Example**

```bash
chmod 666 file1.txt

chmod ug=rwx file1.txt
```

-R : recursively changes the permissions of all files under the specified directory.

0 --- No permissions

1 --x Execute only

2 -w- Write only

3 -wx Write and execute

4 r-- Read only

5 r-x Read and execute

6 rw- Read and write

7 rwx Read, write, and execute

|[-][-][-]-  [------] [---]

| |  |  | |  |  |

| |  |  | |  |  +-----------> 7. Group

| |  |  | |  +-------------------> 6. Owner

| |  |  | +--------------------------> 5. Alternate Access Method

| |  |  +----------------------------> 4. Others Permissions

| |  +-------------------------------> 3. Group Permissions

| +----------------------------------> 2. Owner Permissions

+------------------------------------> 1. File Type

### Linux ACL

You can only assign permissions for a file or directory to a single group or user account.

Linux developers have devised a more advanced method of file and directory security called an access control list (ACL).

ACL permissions use the same read, write, and execute permission bits, but can be assigned to multiple users and groups.

Setfacl Command

The setfacl command allows you to modify the permissions assigned to a file or directory. You define the rule with three formats:

•u[ser]:uid:perms

•g[roup]:gid:perms

•o[ther]::perms

**Example**

•setfacl –m g:staff:rw file1.txt

•setfacl –x g:staff file1.txt

Options:

•-m: modify permissions

•-x: remove permissions

Getfacl Command

The getfacl command allows you to view the ACLs assigned to a file or directory

**Example**

•getfacl file1.txt

Options:

•-d : show directory default ACL entries.

Review

ACL allows you to apply a more specific set of permissions to a file ord irectory

ACL allows this without changing the base ownership and permissions of a file or directory

ACL uses the same permission bits

### umask

Determines the settings of a mask that controls how file permissions are set for newly created files

```bash
umask [-p] [-S] [mask]
```

[mask]: The new permissions mask you are applying. By default, the mask is presented as a numeric (octal) value
[-S]: Displays the current mask as a symbolic value
[-p]: Displays the current mask along with the umask command, allowing it to be copied and pasted as a future input



Set the default permissions with which the files/directories will be created

```bash
umask 543
```

# Hardware

lsusb - list usb devices

lsusb -v - detailer list of usb devices

sudo lshw - hardware information

sudo lshw -short - resumed hardware information

# Logging

[https://en.wikipedia.org/wiki/Syslog](https://en.wikipedia.org/wiki/Syslog)

# Sistema

pwd show current directory

sudo Roda comando em super usuário

sudo reboot, sudo shutdown

history returns the last used commands

Comando + tecla tab: permite escolher entre os arquivos do diretório. Se já começou digitar, ele sugere de acordo

[https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/](https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/)

Networking

arp, domainname, finger, ftp, host, hostname, ip, route, ifconfig, netstat

Job Control

at, atrm, batch, crontab, exec, exit, ipcs, ipcrm, kill, killall

Expression Evaluation

bc, dc, eval, expr, factor, false, true

## Help commands

help commands:

man Pages

info

--help and help

# Outros

### awk

As with sed, short awk commands can be specified directly at the command line, but a more complex script can be saved in a file that you can specify using the -f option.

Specify a command directly at the command line

```bash
awk 'command'  file
```

Specify a file that contains the script to be executed

```bash
awk -f scriptfile file
```

**Examples**

Print entire file

```bash
awk '{ print $0 }' /etc/passwd
```

Print first field (column) of every line, separated by a space

```bash
awk -F: '{ print $1 }' /etc/passwd
```

Print first and seventh field of every line

```bash
awk -F: '{ print $1 $7 }' /etc/passwd 
```
