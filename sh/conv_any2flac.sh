#!/bin/bash
# Convert music folder to flac format
# Usage: conv_any2flac.sh target_dir

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

mkdir -p "$2"
dest=$(realpath "$2")
src="$1"
cd "$src"

drn=${PWD##*/}
f=$(ls | grep -c '\.flac$')
c=$(ls | grep -c '\.cue$')
m=$(ls | grep -c '\.mp3$')
w=$(ls | grep -c '\.wav$')
# echo f c m w $f $c $m $w

echo "--now @ $src"

if [ $m -gt 0 ] ; then
    echo "--Copy all mp3's"
    mkdir -p "$dest/$drn"
    for f in *.mp3; do
        cp "$f" "$dest/$drn/"
        cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
    done
elif  [ $f -gt $c ] ; then
    echo "--Copy all flacs"
    mkdir -p "$dest/$drn"
    for f in *.flac; do
        cp "$f" "$dest/$drn/"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
elif [ $c -gt 0 ] && [ $w -eq 0 ] ; then
    echo "--Convert cue to flac"
    conv_cue2flac.sh . "$dest";
elif [ $w -gt 0 ] && [ $w -gt $c ] ; then
    echo "--Convert wavs to flac"
    mkdir -p "$dest/$drn"
    for f in *.wav; do
        flac "$f" --output-prefix "$dest/$drn/"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
else
    echo Scenario not chosen!!!
fi

