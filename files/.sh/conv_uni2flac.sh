#!/bin/bash
# Convert music folder to flac format
# Usage: conv_uni2flac.sh target_dir

if [ -z $1 ] ; then
  targ='/ln/mo/blink/MUZIK/'
else
  targ="$1"
fi

drn=${PWD##*/}
f=$(ls | grep -c '\.flac$')
c=$(ls | grep -c '\.cue$')
m=$(ls | grep -c '\.mp3$')

if [ $m -gt 0 ] ; 
then # Copy all mp3's
  mkdir -p "$targ/$drn"
  for f in *.mp3; do 
    cp "$f" "$targ/$drn"
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn"
  done
else
  if [ $c -eq 0 ] || [ $f -gt $c ];
  then # Copy all flacs
    mkdir -p "$targ/$drn"
    for f in *.flac; do 
      cp "$f" "$targ/$drn"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn"
  else
    conv_cue2flac.sh . "$targ";
  fi
fi

