#!/bin/bash

if [ "$1" = "--help" ]
then 
	echo Shows ip of local machine
	exit 0
fi

ifconfig | grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1

exit 0
