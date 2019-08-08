. ~/.sh/dmenurc.sh ; str=$(wmctrl -lx | dmenu -i $DMENU_OPTIONS -l 15 ) ; wmctrl -i -a ${str:0:10}
