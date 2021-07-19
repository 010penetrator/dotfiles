#!/bin/bash
echo upk2dir:
echo args are $*
ground=${PWD}
dirname=${PWD##*/}
# echo ground is $ground 
if [ -z "$1" ] || [ -n "$3" ] || [ -d "$1" ] || [ -f "$2" ]; then 
  echo Usage: upk2dir.sh archive.file [OUTDIR]
  exit 1
fi

if [[ "$2" ]] ; then 
  mkdir -p "$2/$1" || { echo Destination unavailable.; exit 1; } 
  dest="$2/$1"
  echo dest is $dest
else 
  echo simple scenario
  mkdir -p "$1"D
  dest="$1"D
fi

# mv "$1" "$dest"
cd "$dest"
upk.sh "$ground/$1" || { echo Unpacking encountered problems.; exit 1; }

if [ "$dirname" != ".del" ] ; then
  cd "$ground" && [ -d ".del" ] && mv "$1" .del/"$1"
fi

