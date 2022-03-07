#!/bin/bash
# Play again one of the recent music albums

if [ -z "$1" ] ; then
  echo "No list file provided. Exiting"
  exit 1
fi

. $sh/dmenurc.sh
# d=$(tac "$1" | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
# Remove duplicates and choose line with dmenu
d=$( cat -n "$1" | sort -uk2 | sort -nr | cut -f2- | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )
if [ -z "$d" ]; then echo no selection !; exit; fi
echo . $d
cd "$d"
# notify-send "$d"

PLAYBACK_CMD="mpv-album . ; ask_album.sh"

case $TERMINAL in
    kitty*)
        TERMINAL="$TERMINAL -o initial_window_height=$(expr 450 + $HIDPI \* 100) -o initial_window_width=$(expr 650 + $HIDPI \* 130)"
        $TERMINAL /bin/bash -c "$PLAYBACK_CMD" &> /dev/null & ;;
    *)
        xterm -xrm 'XTerm.vt100.allowTitleOps: true' -geometry 60x24+400+250 -e "$PLAYBACK_CMD" &> /dev/null & ;;
esac

