#!/bin/bash

if [[ $1 == "--help" ]]
then
	echo Prints nth fibbonaci number
	echo Syntax:
	echo "./fibbonaci.sh <number>"
	exit 0
fi

if [[ ! $1 =~ (^([[:digit:]]+)$) ]]
then
	echo Syntax: >&2
	echo "./fibbonaci.sh <number>" >&2
	exit 1
fi

a=1
b=1
counter=$1

while (( $counter > 2 ))
do
	b=$(( a + b ))
	a=$(( b - a ))
	(( counter-- ))
done

echo $b

exit 0
