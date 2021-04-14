#!/bin/bash

. $sh/dmenurc.sh
d=$(tac /tmp/mpv-history | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
if [ -z "$d" ]; then echo no selection !; exit; fi
cd "$d"
echo $d

# xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "$d -- mpv" -geometry 60x24+400+250 -e 'mpv-album --no-video .' &> /dev/null &
# $TERMINAL -e /bin/bash -c "mpv-album ." 

case $TERMINAL in
    kitty*)
        TERMINAL="$TERMINAL -o initial_window_height=$(expr 450 + $HIDPI \* 100) -o initial_window_width=$(expr 650 + $HIDPI \* 130)"
        $TERMINAL /bin/bash -c "mpv-album ." &> /dev/null & ;;
    *)
        xterm -xrm 'XTerm.vt100.allowTitleOps: true' -geometry 60x24+400+250 -e 'mpv-album .'  &> /dev/null & ;;
esac
