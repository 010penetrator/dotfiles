#!/bin/bash
# Convert .cue music to flac

# $1 is cue path
# $2 is destination

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi
cd "$1"
i='' # CD number

ls "$1" | grep cue$ | while read cuename; do
[[ $i -eq 1 ]] && ((i++))
name=$(cat "$cuename" | grep 'FILE \"')
name=${name#*\"}
name=${name%\"*}
basename=${cuename%cue}
drn=${PWD##*/}$i
# echo // $name
# echo // $drn
# echo .
mkdir -p "$2/$drn"
shnsplit -q -f "$cuename" -d "$2/$drn" -t "%n %t" -o flac "$name"
rm "$2/$drn"/*pregap.flac 2>/dev/null
# Care tagecho 1 && cuetag.sh "$cuename" "$2/$drn"/*.flac ) ||
( command -v cuetag &> /dev/null && echo 2 && cuetag "$cuename" "$2/$drn"/*.flac )
cp 2>/dev/null *[C,c]over.* "$2/$drn/"
cp 2>/dev/null [F,f]ront.* "$2/$drn/"
cp 2>/dev/null [F,f]older.* "$2/$drn/"
cp 2>/dev/null [B,b]ack.* "$2/$drn/"
cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$2/$drn/"
((i++))
done

