#!/bin/bash
# Convert music files in folder to ogg

# $1 is origin path
# $2 is destination
if [ -z "$1" ]; then set -- "." "${2}" ; fi
if [ -z "$2" ]; then set -- "${1}" "." ; fi

# echo co any pwd $(pwd)
src="$1"
cd "$src"
targ="$2"

drn=${PWD##*/}
f=$(ls | grep -c '\.flac$')
c=$(ls | grep -c '\.cue$')
m=$(ls | grep -c '\.mp3$')
w=$(ls | grep -c '\.wav$')
# echo f c m w $f $c $m $w

echo "--now @ $src"

if [ $m -gt 0 ] ; then
    echo "--Copy all mp3's"
    mkdir -p "$targ/$drn"
    for f in *.mp3; do
        cp "$f" "$targ/$drn/"
        cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
    done
elif  [ $f -gt $c ] ; then
    echo "--Convert flacs to ogg"
    mkdir -p "$targ/$drn"
    for f in *.flac; do
        bname=${f%\.flac}
        oggenc -q 8.4 "$f" -o /dev/stdout > "$targ/$drn/${bname}.ogg"
        # echo bname is $bname
        # flac $f ext=ogg oggenc -q 8.4 --output-prefix "$targ/$drn/"
    done
    cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
elif [ $c -gt 0 ] && [ $w -eq 0 ] ; then
    echo "--Convert cue to ogg"
    conv_cue2ogg.sh . "$targ";
elif [ $w -gt 0 ] && [ $w -gt $c ] ; then
    echo "--Convert wavs to ogg"
    mkdir -p "$targ/$drn"
    for f in *.wav; do
        bname=${f%\.wav}
        oggenc -q 8.4 "$f" -o /dev/stdout > "$targ/$drn/${bname}.ogg"
        # bname="$(basename -s .wav $f)"
        # oggenc -q 8.4 "$f" -o "$targ/$drn/${bname}.ogg"
    done
    cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$targ/$drn/"
else
    echo Scenario not chosen!!!
fi

