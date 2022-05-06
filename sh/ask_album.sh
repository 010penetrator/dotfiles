#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo

# If TARG not provided, use PWD
[[ -n $TARG ]] || TARG=$(pwd)

[[ -n $LIST ]] || LIST=$HOME/.mus-playlist
[[ -n $LIBRARY ]] || LIBRARY=$HOME/.mus-library
[[ -n $FAVS ]] || FAVS=$HOME/.mus-library

if ! [[ -d $TARG ]] ; then
    echo "(non-existent)" $TARG @ $(realpath .)
else
    echo $TARG @ $(realpath .)
fi

if [[ "$TARG" =~ "torrents/red/" ]] ; then
    [[ . -nt /ln/torrents/red/KKK ]] && echo --it is a new torrent
    [[ . -ot /ln/torrents/red/KKK ]] && echo --it is an archive torrent
fi
if [[ $( grep -F -c "$TARG" "$FAVS" ) -gt 0 ]] ; then
    echo --it is in favourites list
    INFAVS=1
else
    INFAVS=0
fi
if [[ $( grep -F -c "$TARG" "$LIST" ) -gt 0 ]] ; then
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
    echo "f - add to favourites"
[[ -f $LIST ]] && \
    echo "p - play an album from Playlist"
echo "F - play an album from Favourites"
echo "I - play an album from History"
echo "L - play an album from Library"
echo "<Space> or <CR> - play again"
echo

read -rs -n1 -p "hit some key.." prompt
# read -rsp $'hit some key\n' -n1 prompt
echo

source $sh/dmenurc
if [[ $prompt == "q" ]] ; then
    exit
elif [[ $INLIST != 1 && $prompt == "a" ]] ; then
    realpath . >> "$LIST"
elif [[ $INLIST == 1 && $prompt == "d" ]] ; then
    echo deleting "$TARG"
    grep -vF "$TARG" "$LIST" > /tmp/tmplist && mv /tmp/tmplist "$LIST"
    RUNAGAIN=1
elif [[ $INFAVS == 0 && $prompt == "f" ]] ; then
    echo "$TARG" >> "$FAVS"
    RUNAGAIN=1
elif [[ $prompt == "c" && $INVIFM != 1 ]] ; then
    vifm . -c "wincmd o"
elif [[ $prompt == "" ]] ; then
    PAUSE=0 mpv-album .
    # ask_album.sh
elif [[ -f $LIST ]] && [[ $prompt == "p" ]] ; then
    SELECT=$( cat -n "$LIST" | sort -nr | sort -uk2 | sort -n | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $LIST ]] && [[ $prompt == "F" ]] ; then
    SELECT=$( cat -n "$FAVS" | sort -nr | sort -uk2 | sort -n | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $LIBRARY ]] && [[ $prompt == "L" ]] ; then
    SELECT=$( cat $LIBRARY | sort -R | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $HOME/.mus-history ]] && [[ $prompt == "I" ]] ; then
    echo 12341234
    echo $DMENU_OPTIONS
    SELECT=$( cat -n $HOME/.mus-history | sort -nr | sort -uk2 | sort -nr | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
else
    clear
    echo pwd is $(pwd)
    echo
    echo Will exit in a second..
    sleep 0.8
    exit
fi

[[ $RUNAGAIN == 1 ]] && ask_album.sh

