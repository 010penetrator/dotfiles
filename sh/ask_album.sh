#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo .
echo $PWD
if [[ "$PWD" =~ "torrents/red/" ]] ; then
    [[ . -nt /ln/torrents/red/KKK ]] && echo --it is a new torrent
    [[ . -ot /ln/torrents/red/KKK ]] && echo --it is an archive torrent
fi
echo
[[ $INVIFM == 1 ]] && echo "q" - back to vifm || \
echo "q" - quit
echo "h" - add to history and quit
echo "f" - add to favourites and quit
[[ $INVIFM != 1 ]] && echo "c" - inspect directory with vifm
echo "p" - play again
echo
read -rsn 1 -p "hit some key.." prompt
echo

if [[ $prompt == "q" ]] ; then
    exit
elif [[ $prompt == "h" ]] ; then
    echo $PWD/// >> $HOME/.mpv-history
elif [[ $prompt == "f" ]] ; then
    echo $PWD >> $HOME/.mpv-favourites
elif [[ $prompt == "c" && $INVIFM == 1 ]] ; then
    vifm .
elif [[ $prompt == "p" ]] ; then
    PAUSE=0 mpv-album . -c "wincmd o"
    ask_album.sh
else
    clear
    echo pwd is $PWD
    echo
    echo Will exit in 3 seconds..
    sleep 3
    exit
fi

