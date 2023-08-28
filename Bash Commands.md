
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

## Navegation

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

### ls: List files

Mostra arquivos no diretório atual
```bash
ls
```

will list all the files in the sub-directories as well
```bash
ls -R
```

show all files, even the hidden files
```bash
ls -a
```

will list the files and directories with detailed information like the permissions, size, owner, etc.
```bash
ls -al
```

list files with sizes
```bash
ls -lh
```

## Aliases

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

## & operator

With & the process starts in the background, so you can continue to use the shell and do not have to wait until the script is finished. If you forget it, you can stop the current running process with Ctrl-Z

# Files


### cat: Type out (concatenate) the files

cat is short for concatenate and is one of the most frequently used Linux command line utilities. It is often used to read and print files, as well as for simply viewing file contents. To view a file, use the following command:

```bash
cat <filename>
```

For example, cat readme.txt will display the contents of readme.txt on the terminal. However, the main purpose of cat is often to combine (concatenate) multiple files together. You can perform the actions listed in the table using cat.

Concatenate multiple files and display the output; i.e. the entire content of the first file is followed by that of the second file

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

The tac command (cat spelled backwards) prints the lines of a file in reverse order. Each line remains the same, but the order of lines is inverted. The syntax of tac is exactly the same as for cat, as in:

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

### less

Look at the file, one screenful at a time

displays the content of a file partially and allows for easy navigation through the text. It keeps the terminal output clean and loads files quickly, as it only loads the current text on the screen.

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

### rm

Remove files

deleta arquivo

```bash
rm "arquivo"
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

Rename (move) files

```bash
mv file.txt /home/username/Pictures Move o arquivo do diretório atual para o diretório especificado
```

renomeia o arquivo

```bash
mv oldname.ext newname.ext
```

mv is used for move and rename

Rename a file or folder

```bash
mv file1 file2
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

cp file.txt /home/username/Pictures Copia o arquivo do diretório atual para o diretório especificado

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

touch "arquivo.txt" Cria arquivo

### wc

Count lines, words, and bytes in a file

## File Compression

bunzip2, bzcat, bdiff, bzip2, bzless

gunzip, gzexe, gzip, zcat, zless

zip, upzip

xz, unxz, xzcat

## Viewing Compressed Files

When working with compressed files, many standard commands cannot be used directly. For many commonly-used file and text manipulation programs, there is also a version especially designed to work directly with compressed files. These associated utilities have the letter "z" prefixed to their name. For example, we have utility programs such as zcat, zless, zdiff and zgrep.

Here is a table listing some z family commands:

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

## Search

### Find

The find command line utility provides an extremely powerful and flexible method for locating files based on their properties, including name. It does not search the interior of files for patterns, etc.; that is more the province of **grep** and its variations, which we will discuss later.

The general form of a **find** command is:

```bash
find [location] [criteria] [actions]
```

where there are three classes of arguments, each of which may be omitted. If no location is given, the current directory **(.)** is assumed; if no criteria are given, all files are displayed; and, if no actions are given, only a listing of the names is given.

There are many logical expressions which can be used for criteria. For example, the command:

```bash
find /etc -name  "*.conf"
```

will print out the names of all files in the **/etc** directory and its descendants, recursively, that end in **.conf**. To specify a simple action request:

```bash
find /etc -name  "*.conf"  -ls
```

will print out a long listing, not just the names.

A little more complicated example is the following:

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

Search inside files

Can be used to filter a command, such as

```bash
| grep May
```

It will show only line with the content

```bash
ls -l *.ps | grep May
```

grep blue notepad.txt procura "blue" no arquivo texto

|  |  |
|--|--|
|  |  |

**grep** is a workhorse command line utility whose basic job is to search files for patterns and print out matches according to specified options.

Its name stands for global regular expression print, which points out that it can do more than just match simple strings; it can work with more complicated regular expressions which can contain wildcards and other special attributes.

The simplest example of using **grep** would be:

```bash
$ grep pig file

pig food
pig
dirty pig
```

which finds three instances of the string "pig" in file.

As an example:

```bash
grep  -i  -e pig -e dog -r .
```

will search all files in the current directory and those below it for the strings "pig" or "dog", ignoring case.

If we try to explore the use of regular expressions in detail, it would be a large topic, but here are some examples:

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

**grep** has many options; some of the most important are:

Option

Meaning

**-i**

Ignore case

**-v**

Invert match

**-n**

Print line number

**-H**

Print filename

**-a**

Treat binary files as text

**-I**

Ignore binary files

**-r**

Recurse through subdirectories

**-l**

Print out names of all files that contain matches

**-L**

Print out names of all files that do not contain matches

**-c**

Print out number of matching lines only

**-e**

Use the following pattern; useful for multiple strings and special characters

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

## Permissions

### chgrp

The root user account can change the group assigned to a file or directory by using the chgrp command.

Example Usage:

```bash
chgrp staff file1.txt

chgrp –R staff /home/john
```

Options:

• -R : recursively changes the group of all files under the specified directory.

### chmod

The root user account or the owner of the file or directory can

change the assigned permissions by using the chmod command

Example Usage:

```bash
chmod 666 file1.txt

chmod ug=rwx file1.txt
```

Options:

• -R : recursively changes the permissions of all files under the specified directory.

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

Example Usage:

•setfacl –m g:staff:rw file1.txt

•setfacl –x g:staff file1.txt

Options:

•-m: modify permissions

•-x: remove permissions

Getfacl Command

The getfacl command allows you to view the ACLs assigned to a file or directory

Example Usage:

•getfacl file1.txt

Options:

•-d : show directory default ACL entries.

Review

ACL allows you to apply a more specific set of permissions to a file ord irectory

ACL allows this without changing the base ownership and permissions of a file or directory

ACL uses the same permission bits

# Hardware

lsusb - list usb devices

lsusb -v - detailer list of usb devices

sudo lshw - hardware information

sudo lshw -short - resumed hardware information

# Logging

[https://en.wikipedia.org/wiki/Syslog](https://en.wikipedia.org/wiki/Syslog)

# Outros

# Sistema

pwd show current directory

sudo Roda comando em super usuário

sudo reboot, sudo shutdown

history returns the last used commands

help commands:

man Pages

info

--help and help

Comando + tecla tab: permite escolher entre os arquivos do diretório. Se já começou digitar, ele sugere de acordo

[https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/](https://www.cyberciti.biz/faq/howto-compile-and-run-c-cplusplus-code-in-linux/)

```bash
cat > myfile.txt
```

Now, just type whatever you want in the file:

Hello World!

CTRL-D to save and exit

tree

Sudo apt install tree

Shows a visual tree of files and directories hierachy

Networking

arp, domainname, finger, ftp, host, hostname, ip, route, ifconfig, netstat

Job Control

at, atrm, batch, crontab, exec, exit, ipcs, ipcrm, kill, killall

Expression Evaluation

bc, dc, eval, expr, factor, false, true