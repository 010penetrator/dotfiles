#!/bin/bash

[[ -z $1 ]] && echo "ask_feh: Bad args!" && exit
source /ln/sh/dmenurc
pwd
dest=$( find . -maxdepth 2 -type d -printf '%P\n' | grep -v ^$ | dmenuy )
[[ -z $dest ]] ||
    { mkdir -p "$dest" ; mv --backup=numbered "$1" "$dest"/ ; }

