#!/bin/bash
# Convert .cue music to ogg

# $1 is cue path
# $2 is destination

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi
cd "$1"
i=''

ls "$1" | grep cue | while read cname; do
[[ $i -eq 1 ]] && ((i++))
name=$(cat "$cname" | grep 'FILE \"')
name=${name#*\"}
name=${name%\"*}
basename=${cname%cue}
drn=${PWD##*/}$i
echo // $name
echo // $drn
echo .
mkdir -p "$2/$drn"
shnsplit -f "$cname" -d "$2/$drn" -t "%n %t" -o "flac ext=ogg oggenc -q 8.4 -o %f -" "$name"
rm "$2/$drn"/*pregap.ogg
# Care tags
( command -v cuetag.sh &> /dev/null && echo 1 && cuetag.sh "$cname" "$2/$drn"/*.flac ) ||
( command -v cuetag &> /dev/null && echo 2 && cuetag "$cname" "$2/$drn"/*.flac )
cp 2>/dev/null *[C,c]over.* "$2/$drn/"
cp 2>/dev/null [F,f]ront.* "$2/$drn/"
cp 2>/dev/null [F,f]older.* "$2/$drn/"
cp 2>/dev/null [B,b]ack.* "$2/$drn/"
cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$2/$drn/"
((i++))
done

