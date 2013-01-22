#!/bin/bash

if test "$1" = "--help"
then
	echo Prints count of line in specified file
	echo Syntax:
	echo "./count_lines.sh <file>"
	exit 0
fi

if test -d "$1" 
then
	echo "It's a directory" >&2
	exit 1
fi

if test "$1" = ""
then
	echo No file specified >&2
	exit 1
fi

if test ! -f "$1"
then
	echo File does not exist >&2
	exit 1
fi

wc -l < "$1"

exit 0
