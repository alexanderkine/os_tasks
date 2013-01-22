#!/bin/bash

if [[ $1 == "" ]]; then echo "No parameter, use \"chex <filename>\" syntax instead" && exit 0; fi

if [[ ! -f $1 ]]; then echo "Specified file does not exist" && exit 0; fi

oldIFS="$IFS"
oldLANG="$LANG"
IFS=""
LANG=C

offset=-16
textValue=""
hexValue=""

while read -r -d '' -n 1 char
do
	((offset++))
	printf -v val "%02x" "'$char" 
	if (( "0x$val" < 0x21 || "0x$val" > 0x7e ))
	then
		textValue+="."
	else
		textValue+=$char
	fi
	hexValue+="$val "
	if (( $offset % 8 == 0 )); then hexValue+="  "; fi
	if (( $offset % 16 == 0 ))
	then
		printf "%08x " "$offset"
		printf "%s" "$hexValue"
		printf "|%s|\n" "$textValue"
		hexValue=""
		textValue=""
	fi
done <<< `cat "$1"`

((offset = $offset - $offset % 16 + 16 ))

printf "%08x " "$offset"
printf "%-52s" "$hexValue"
printf "|%-16s|\n" "$textValue"

FS="$oldIFS"
LANG="$oldLANG"
