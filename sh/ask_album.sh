#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo .

# If TARG not provided, use PWD
[[ -n $TARG ]] || TARG=$(pwd)

if ! [[ -d $TARG ]] ; then
    echo "(non-existent)" "$TARG"
else
    echo $TARG
fi

if [[ "$TARG" =~ "torrents/red/" ]] ; then
    [[ . -nt /ln/torrents/red/KKK ]] && echo --it is a new torrent
    [[ . -ot /ln/torrents/red/KKK ]] && echo --it is an archive torrent
fi
if [[ $(grep -F -c "$TARG" $HOME/.mpv-favourites) -gt 0 ]] ; then
    echo --it is in favourites list
    INFAVS=1
else
    INFAVS=0
fi
if [[ $(grep -F -c "$TARG" $HOME/.mpv-playlist) -gt 0 ]] ; then
    echo --it is in play list
    INLIST=1
else
    INLIST=0
fi
echo

[[ $INVIFM == 1 ]] && \
    echo "q" - back to vifm || \
    echo "q - quit"
[[ $INVIFM != 1 ]] && \
    echo "c - inspect directory with vifm"
[[ $INLIST == 1 ]] && \
    echo "d - delete from playlist" || \
    echo "a - add to playlist and quit" 
[[ $INFAVS == 0 ]] && \
    echo "f - add to favourites and quit"
[[ -f $LIST ]] && \
    echo "n - play an album from Playlist"
echo "L - play an album from Library"
echo "F - play an album from Favourites"
echo "<Space> or <CR> - play again"
echo

read -rs -n1 -p "hit some key.." prompt
# read -rsp $'hit some key\n' -n1 prompt
echo

if [[ $prompt == "q" ]] ; then
    exit
elif [[ $INLIST != 1 && $prompt == "a" ]] ; then
    realpath . >> $HOME/.mpv-playlist
elif [[ $INLIST == 1 && $prompt == "d" ]] ; then
    echo deleting "$TARG"
    grep -vF "$TARG" $HOME/.mpv-playlist > /tmp/tmplist && mv /tmp/tmplist $HOME/.mpv-playlist
    INLIST=2
elif [[ $INFAVS == 1 && $prompt == "f" ]] ; then
    echo "$TARG" >> $HOME/.mpv-favourites
elif [[ $prompt == "c" && $INVIFM != 1 ]] ; then
    vifm . -c "wincmd o"
elif [[ $prompt == "" ]] ; then
    PAUSE=0 mpv-album .
    # ask_album.sh
elif [[ -f $LIST ]] && [[ $prompt == "n" ]] ; then
    # source $sh/dmenurc
    # SELECT=$( tac $LIST | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    SELECT=$( cat -n "$LIST" | sort -uk2 | sort -nr | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=0 mpv-album "$SELECT"
elif [[ -f $LIST ]] && [[ $prompt == "F" ]] ; then
    SELECT=$( cat -n "$HOME/.mpv-favourites" | sort -uk2 | sort -nr | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=0 mpv-album "$SELECT"
elif [[ -f $LIST ]] && [[ $prompt == "L" ]] ; then
    SELECT=$(cat $HOME/.mus-list | sort -R | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
    ASK=1 PAUSE=0 mpv-album "$SELECT"
else
    clear
    echo pwd is $(pwd)
    echo
    echo Will exit in a second..
    sleep 1.8
    exit
fi

[[ $INLIST == 2 ]] && ask_album.sh

