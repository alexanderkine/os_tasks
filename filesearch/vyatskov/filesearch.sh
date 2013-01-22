#!/bin/bash

if test "$1" = "--help"
then
	echo "Prints locations of file(s) with name like regex"
	echo Syntax:
	echo "./filesearch.sh [-f] \"<regex>\""
	echo "-f : print filenames, not folders"
	exit 0
fi

if test "$1" = ""
then
	echo "No arguments given" >&2
	echo "Try --help for help" >&2
	exit 1
fi

flag=

if [[ "$1" = "-f" ]]
then
	flag=1
	shift
fi

echo "Given pattern: $1"

IFS=

result=

while read file
do
	if [[ -f "$file" && $(basename $file) =~ ^$1$ ]]
	then
		if [[ $flag = 1 ]]
		then
			result=`echo -ne "$result\n$file"`
		else
			result=`echo -ne "$result\n$(dirname $file)"`
		fi
	fi
done <<< `find "$PWD"`

echo $result | sort | uniq

exit 0
