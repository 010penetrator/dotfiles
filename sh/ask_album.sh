#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo at
echo $PWD
echo
echo "q" - quit
echo "c" - inspect directory with vifm
echo "p" - play audio with mpv
echo
read -rsn 1 -p "hit some key.." prompt
echo

if [[ $prompt == "q" ]] ; then
    exit
elif [[ $prompt == "c" ]] ; then
    vifm .
elif [[ $prompt == "p" ]] ; then
    PAUSE=0 mpv-album . -c "wincmd o"
    ask_album.sh
fi

