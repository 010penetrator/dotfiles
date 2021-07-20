#!/bin/bash
# Convert music folder to flac format
# Usage: conv_uni2flac.sh target_dir

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

cd "$1"
targ="$2"

drn=${PWD##*/}
f=$(ls | grep -c '\.flac$')
c=$(ls | grep -c '\.cue$')
m=$(ls | grep -c '\.mp3$')
w=$(ls | grep -c '\.wav$')

if [ $m -gt 0 ]
then # Copy all mp3's
  mkdir -p "$targ/$drn"
  for f in *.mp3; do 
    cp "$f" "$targ/$drn/"
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
  done
elif  [ $f -gt $c ]
then # Copy all flacs
  mkdir -p "$targ/$drn"
  for f in *.flac; do 
    cp "$f" "$targ/$drn/"
  done
  cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
elif [ $c -gt 0 ] && [ $w -eq 0 ]
then # Do cue to flac
  conv_cue2flac.sh . "$targ";
elif [ $w -gt 0 ] && [ $w -gt $c ]
then # Convert wav to flac
  mkdir -p "$targ/$drn"
  for f in *.wav; do
    flac "$f" --output-prefix "$targ/$drn/"
  done
  cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
else
  echo Scenario not chosen
fi

