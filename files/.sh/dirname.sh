# get dirname
[ -f "$1" ] && dir=$(dirname "$1") && echo ${dir##*/}
[ -d "$1" ] && step=${1##*/?} && echo ${step%%/}

