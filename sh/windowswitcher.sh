#!/bin/bash
# dmenu window-switcher
source ~/.sh/dmenurc.sh ; str=$(wmctrl -lx | dmenu -i $DMENU_OPTIONS -fn "$DMENU_FN" -l 15 ) ; wmctrl -i -a ${str:0:10}

