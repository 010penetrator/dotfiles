#!/bin/bash
# Choose music album with dmenu and play it with mpv

if [ -z "$1" ] ; then set -- "${1}" ".mus-library" ; fi

source $sh/dmenurc
d=$(cat $1 | sort -R | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
if [ -z "$d" ]; then echo no selection !; exit; fi

# Construct command for to spawn terminal
case $TERMINAL in
kitty*)
    NEW_TERMINAL="$TERMINAL -o initial_window_height=$(expr 450 + $HIDPI \* 140) -o initial_window_width=$(expr 650 + $HIDPI \* 150) /bin/bash -c"
    ;;
*)
    NEW_TERMINAL="xterm -xrm 'XTerm.vt100.allowTitleOps:true' -geometry 60x24+400+250 -e"
    # xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "$l - MPV" -geometry 60x24+400+250 -e mpv --pause --no-video . &> /dev/null &
    ;;
esac

PLAYER_CMD="ASK=1 mpv-album"

case $(echo "$d" | wc -l) in
0)
    echo noth
    ;;
1)
    # cd "$d"
    # echo will play $(pwd)
    # $NEW_TERMINAL "$PLAYER_CMD"
    BASH_CMD="$PLAYER_CMD \"$d\""
    $NEW_TERMINAL "$BASH_CMD"
    ;;
*)
    echo "$d" | \
        while read l ; do
            BASH_CMD="$PLAYER_CMD \"$l\""
            $NEW_TERMINAL "$BASH_CMD" &
        done
    ;;
esac

