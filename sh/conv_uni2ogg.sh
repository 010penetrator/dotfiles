#!/bin/bash
# Convert music folder to ogg format

# $1 is origin path
# $2 is destination
if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

f=$(ls | grep -c '\.flac$');
c=$(ls | grep -c '\.cue$');
if [ $c -eq 0 ] || [ $f -gt $c ];
	then conv_flac2ogg.sh "$1" "$2";
	else conv_cue2ogg.sh "$1" "$2";
fi

