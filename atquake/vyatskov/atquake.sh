#!/bin/bash

IFS=

if [[ ! "$1" = "" && ! "$1" = "-r" ]]
then
	echo "Wrong argument(s)" >&2
	echo "Syntax:" >&2
	echo "./atquake.sh [-r]" >&2
	echo "-r for restarting if finds something" >&2
	exit 1
fi

while read path
do
	fullname=`echo $path | awk -F " " '{print $11}'`
	if [[ "$(basename $fullname)" =~ "calc" ]]
	then
		if [[ "$1" = "-r" ]]
		then
			echo RESTARTING! MUAHAHAHA
			#sutdown -r
			exit 0
		fi
		kill `echo $path | awk -F " " '{print $2}'`
		echo KILLED SOME WITH PID `echo $path | awk -F " " '{print $2}'`
	fi
done <<< `ps aux | grep "calc"`

echo "Seems like you don't have any of that anymore"

exit 0
