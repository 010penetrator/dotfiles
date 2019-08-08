
mkdir -p "$1"D
mv "$1" "$1"D
cd "$1"D
upk.sh "$1" && mv "$1" ../.del."$1"

