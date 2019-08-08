targ='/ln/mo/blink/MUZIK/'
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
    cue2flac.sh . /ln/mo/blink/MUZIK/;
  fi
fi

