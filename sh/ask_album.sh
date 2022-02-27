#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo .
echo $PWD
echo
echo "q" - quit
echo "h" - add to history and quit
echo "f" - add to favourites and quit
echo "c" - inspect directory with vifm
echo "p" - play audio with mpv
echo
read -rsn 1 -p "hit some key.." prompt
echo

if [[ $prompt == "q" ]] ; then
    exit
elif [[ $prompt == "h" ]] ; then
    echo $PWD/// >> $HOME/.mpv-history
elif [[ $prompt == "f" ]] ; then
    echo $PWD >> $HOME/.mpv-favourites
elif [[ $prompt == "c" ]] ; then
    vifm .
elif [[ $prompt == "p" ]] ; then
    PAUSE=0 mpv-album . -c "wincmd o"
    ask_album.sh
else
    clear
    echo pwd is $PWD
    echo
    echo Will exit in 5 seconds..
    sleep 5
    exit
fi

