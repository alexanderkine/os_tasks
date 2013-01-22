#!/bin/bash

if [[ $1 == "--help" ]]
then
	echo Creates some file in speciefied directory
	echo Syntax:
	echo "./tempfile.sh <folder>"
	exit 0
fi

if [[ $1 == "" ]]
then
	echo No parameter specified >&2
	exit 1
fi

if [[ ! -d $1 ]]
then
	echo Specified directory does not exist >&2
	exit 1
fi
suf=$RANDOM
while [[ -e $1/temp$suf ]]
do
	(( suf++ ))
done
if [[ ! -e $1/temp$suf ]]
then
	file=$1/temp$suf
	file=${file//\/\//\/}
	touch $file
	echo Created file $file
	exit 0
fi

exit 0
