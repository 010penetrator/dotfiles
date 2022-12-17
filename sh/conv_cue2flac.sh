#!/bin/bash
# Convert .cue music to flac

# $1 is cue path
# $2 is destination

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi

mkdir -p "$2"
dest=$(realpath "$2")
src="$1"
cd "$src"

i='' # CD number

ls . | grep "\.cue$" | while read cuename; do
[[ $i -eq 1 ]] && ((i++))
name=$(cat "$cuename" | grep 'FILE ')
name=${name#*\"}
name=${name%\"*}
basename=${cuename%cue}
drn=${PWD##*/}$i
# echo // $name
# echo // $drn
# echo .
mkdir -p "$dest/$drn"
shnsplit -q -f "$cuename" -d "$dest/$drn" -t "%n %t" -o flac "$name"
rm "$dest/$drn"/*pregap.flac 2>/dev/null

# Care tags
command -v "cuetag.sh" &> /dev/null && CT_CMD="cuetag.sh"
command -v "cuetag"    &> /dev/null && CT_CMD="cuetag"
[[ -n $CT_CMD ]] && $CT_CMD "$cuename" "$dest/$drn"/*.flac

cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$dest/$drn/"
cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
((i++))
done

