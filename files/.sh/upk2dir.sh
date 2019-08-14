echo keys are $*
ground=${PWD}
echo ground is $ground 
if [ -z "$1" ] ; then 
  echo Specify target 
  exit 
fi
if [[ "$2" ]] ; then 
  mkdir -p "$2/$1" || { echo Destination unavailable.; exit 1; } 
  dest="$2/$1"
  echo dest is $dest
else 
  echo old route
  mkdir -p "$1"D
  dest="$1"D
fi

# mv "$1" "$dest"
cd "$dest"
upk.sh "$ground/$1"
# && mv "$1" "$ground"/.del."$1"

