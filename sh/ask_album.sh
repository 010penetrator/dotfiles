#!/bin/bash
# Ask what to do in current directory

clear
echo What would you like to do next?
echo

# If TARG not provided, use PWD
[[ -n $TARG ]] || TARG=$(pwd)

if ! [[ -d $TARG ]] ; then
    echo "(non-existent)" "$TARG" @ $(realpath .)
    TARGREAL="not found"
else
    echo "$TARG" @ $(realpath .)
    TARGREAL=$(realpath "$TARG")
    echo "(exact)" "$TARGREAL"
fi

[[ -z $LIBRARY ]] && LIBRARY=$HOME/.mus-library
[[ -z $FAVS ]] && FAVS=$HOME/.mus-favourites
[[ $LIST == $LIBRARY || $LIST == $FAVS || -z $LIST ]] &&
    LIST=$HOME/.mus-playlist
HIST=$HOME/.mus-history

if [[ "$TARG" =~ "torrents/red/" ]] ; then
    [[ . -nt /ln/torrents/red/KKK ]] && echo --it is a new torrent
    [[ . -ot /ln/torrents/red/KKK ]] && echo --it is an archive torrent
fi
if [[ $( grep -F -c "$TARGREAL" "$FAVS" ) -gt 0 ]] ; then
    echo --it is in favourites list
    INFAVS=1
else
    INFAVS=0
fi
if [[ $( grep -F -c "$TARGREAL" "$LIST" ) -gt 0 ]] ; then
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
    echo "a - add to playlist"
[[ $INFAVS == 0 ]] && \
    echo "s - save to favourites"
[[ -f $LIST ]] && \
    echo "p - play an album from Playlist"
echo "f - play an album from Favourites"
echo "i - play an album from History"
echo "l - play an album from Library"
echo "<Space> or <CR> - play again"
echo

read -rs -n1 -p "hit some key.." prompt
# read -rsp $'hit some key\n' -n1 prompt
echo

source $sh/dmenurc
if [[ $prompt == "q" ]] ; then
    exit
elif [[ $INLIST != 1 && $prompt == "a" ]] ; then
    echo "$TARGREAL" >> "$LIST"
    RUNAGAIN=1
elif [[ $INLIST == 1 && $prompt == "d" ]] ; then
    echo deleting "$TARGREAL"
    grep -vF "$TARGREAL" "$LIST" > /tmp/tmplist && mv /tmp/tmplist "$LIST"
    RUNAGAIN=1
elif [[ $INFAVS == 0 && $prompt == "s" ]] ; then
    echo "$TARGREAL" >> "$FAVS"
    RUNAGAIN=1
elif [[ $prompt == "c" && $INVIFM != 1 ]] ; then
    vifm "$TARGREAL" -c "wincmd o"
elif [[ $prompt == "" ]] ; then
    PAUSE=0 mpv-album "$TARGREAL"
    # ask_album.sh
elif [[ -f $LIST ]] && [[ $prompt == "p" ]] ; then
    SELECT=$( cat -n "$LIST" | sort -n | sort -uk2 | sort -nr | cut -f2- | dmenuy )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $LIST ]] && [[ $prompt == "f" ]] ; then
    SELECT=$( cat -n "$FAVS" | sort -n | sort -uk2 | sort -nr | cut -f2- | dmenuy )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $LIBRARY ]] && [[ $prompt == "l" ]] ; then
    # notify-send "lib is $LIBRARY"
    SELECT=$( cat "$LIBRARY" | sort -R | dmenuy )
    ASK=1 PAUSE=1 mpv-album "$SELECT"
elif [[ -f $HIST ]] && [[ $prompt == "i" ]] ; then
    SELECT=$( cat -n "$HIST" | sort -n | sort -uk2 | sort -nr | cut -f2- | dmenuy )
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

