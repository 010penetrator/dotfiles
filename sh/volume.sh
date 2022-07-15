#!/bin/bash
# Adjust master volume

if [[ -z $1 ]]; then
    echo "Usage: volume.sh +-N"
    exit
fi

# This script is assigned to a key that repeats, hence the locking
lock=/dev/shm/mvolume.lock

# mkdir is less overhead than flock
mkdir $lock || exit
trap "rmdir $lock" EXIT

arg=$( echo "$1" | tr -cd [:digit:]'-'+ )
sign=$( echo "$arg" | cut -c 1 )
[[ $sign != '+' && $sign != '-' ]] && unset sign
val=$( echo "$arg" | tr -cd [:digit:] )
# echo a1 "$1" , sign $sign , arg $arg , val $val

# pactl -- set-sink-volume @DEFAULT_SINK@ ${1}%
# amixer set Master 3%+ | tail -1 | cut -d '[' -f2 | cut -d '%' -f1
amixer set Master $val'%'$sign
curvol=$(amixer sget Master | tail -1 | cut -d '[' -f2 | cut -d '%' -f1)

echo --Result volume is $curvol
[[ $curvol -eq 100 ]] && notify-send "Volume MAX" -t 400

