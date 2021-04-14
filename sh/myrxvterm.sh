#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ] ; then
  echo "Usage: bigterm.sh \"size\" \"font\""
  exit
fi

if [ -z "$2" ] ; then set -- "${1}" "Liberation Mono for Powerline" ; fi

urxvt -fn xft:"$2":size="$1":style=Regular:antialias=true -e zsh &

