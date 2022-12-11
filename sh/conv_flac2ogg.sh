#!/bin/bash
# Convert flac tracks to ogg VBR0

# $1 is origin path
# $2 is destination
if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

cd $1

drn=${PWD##*/}
mkdir -p "$2/$drn"
for f in *.flac; do
  oggenc -q 8.4 "$f" -o "$2/$drn/$f.ogg" &
  # ffmpeg -i "$f" -qscale:a 8.4 "$2/$drn/$f.ogg"
done

cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$2/$drn/"

