#!/bin/bash
# Convert .cue music to ogg

# Usage: conv_cue2ogg.sh path/to/cue destination/dir

if [ -z "$1" ] ; then set -- "." "${2}" ; fi
if [ -z "$2" ] ; then set -- "${1}" "." ; fi
cd "$1"
i=''

ls "$1" | grep "\.cue$" | while read cname; do
[[ $i -eq 1 ]] && ((i++))
name=$(cat "$cname" | grep 'FILE ')
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
command -v "cuetag.sh" &> /dev/null && CT_CMD="cuetag.sh"
command -v "cuetag"    &> /dev/null && CT_CMD="cuetag"
# [[ -n $CT_CMD ]] && $CT_CMD "$cuename" "$2/$drn"/*.ogg

cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$2/$drn/"
cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$2/$drn/"
((i++))
done

