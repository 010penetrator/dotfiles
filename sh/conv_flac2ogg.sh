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
  oggenc -q 8.4 -n "$2/$drn/$f.ogg" "$f" 
  # ffmpeg -i "$f" -qscale:a 8.4 "$2/$drn/$f.ogg"
done

cp *[C,c]over.* "$2/$drn/"
cp [F,f]ront.* "$2/$drn/"
cp [F,f]older.* "$2/$drn/"
cp [B,b]ack.* "$2/$drn/"

