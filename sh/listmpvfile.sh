#!/bin/bash
# Play again one of the recent music albums

if [ -z "$1" ] ; then
  echo "No list file provided. Exiting"
  exit 1
fi

source $sh/dmenurc
# d=$(tac "$1" | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
# Remove duplicates and choose line with dmenu
d=$( cat -n "$1" | sort -uk2 | sort -nr | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
if [ -z "$d" ]; then echo no selection !; exit; fi
echo . $d
# notify-send "$d"

export LIST="$1"
PLAYER_CMD="ASK=1 mpv-album"

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

BASH_CMD="$PLAYER_CMD \"$d\""
$NEW_TERMINAL "$BASH_CMD"

