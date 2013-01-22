#!/bin/bash

if [[ $1 == "--help" ]]
then
	echo Sleeps for specified time in seconds
	echo Syntax:
	echo "./sleep_ping.sh <number>"
	exit 0
fi

if [[ ! $1 =~ (^([[:digit:]]+)$) ]]
then
	echo Syntax: >&2
	echo "./sleep_ping.sh <number>" >&2
	exit 1
fi

#date
ping 127.0.0.1 -c $(( $1 + 1 )) -i 1 > /dev/null 2> /dev/null
#date

exit 0
