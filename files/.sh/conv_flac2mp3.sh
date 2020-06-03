#!/bin/bash
# Convert flac tracks to mp3 VBR0

# $1 is origin path
# $2 is destination

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

cd $1

drn=${PWD##*/}
mkdir -p "$2/$drn"
for f in *.flac;
do ffmpeg -i "$f" -qscale:a 0 "$2/$drn/$f.mp3"
done

cp *[C,c]over.* "$2/$drn"
cp [F,f]ront.* "$2/$drn"
cp [F,f]older.* "$2/$drn"
cp [B,b]ack.* "$2/$drn"

