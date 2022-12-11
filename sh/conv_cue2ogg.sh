#!/bin/bash
# Convert .cue music to ogg

# Usage: conv_cue2ogg.sh path/to/cue destination/dir

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi
cd "$1"
i=''

sorc="$1"
dest="$2"

ls "$sorc" | grep "\.cue$" | while read cuename; do
[[ $i -eq 1 ]] && ((i++))
name=$(cat "$cuename" | grep 'FILE ')
name=${name#*\"}
name=${name%\"*}
basename=${cuename%cue}
drn=${PWD##*/}$i
echo // $name
echo // $drn
echo .
mkdir -p "$dest/$drn"
shnsplit -f "$cuename" -d "$dest/$drn" -t "%n %t" -o "flac ext=ogg oggenc -q 8.4 -o %f -" "$name"
rm "$dest/$drn"/*pregap.ogg 2>/dev/null

# Care tags
command -v "cuetag.sh" &> /dev/null && CT_CMD="cuetag.sh"
command -v "cuetag"    &> /dev/null && CT_CMD="cuetag"
[[ -n $CT_CMD ]] && $CT_CMD "$cuename" "$dest/$drn"/*.ogg

cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$dest/$drn/"
cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$2/$drn/"
((i++))
done

