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
exit_code=0

i='' # CD number

# ls . | grep "\.cue$" | { while read cuefile
for cuefile in *.cue; do
    [[ $i -eq 1 ]] && ((i++))
    name=$(cat "$cuefile" | grep 'FILE ')
    name=${name#*\"}
    name=${name%\"*}
    basename=${cuefile%cue}
    drn=${PWD##*/}$i
    # echo // $name
    # echo // $drn
    # echo .
    mkdir -p "$dest/$drn"
    shnsplit -q -f "$cuefile" -d "$dest/$drn" -t "%n %t" -o flac "$name"
    exc=$?
    # ((exit_code+=8))
    ((exit_code+=$exc))
    # echo "ecx is $exit_code "
    rm "$dest/$drn"/*pregap.flac 2>/dev/null

    # Care tags
    command -v "cuetag.sh" &> /dev/null && CT_CMD="cuetag.sh"
    command -v "cuetag"    &> /dev/null && CT_CMD="cuetag"
    if [[ -n $CT_CMD ]]; then
        out=$($CT_CMD "$cuefile" "$dest/$drn"/*.flac 2>&1)
        if [[ -n $out ]]; then
            ((exit_code++))
            echo $out
        fi
        # exc=$? ; ((exit_code+=$exc)) # this doesn't catch some errors((
    fi

    cp 2>/dev/null "$basename"{jpg,JPG,jpeg} "$dest/$drn/"
    cp 2>/dev/null [C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
    ((i++))
    done

# echo "exit_code_$exit_code"
exit $exit_code

