#!/bin/bash
# dmenu window-switcher
source $sh/dmenurc
str=$(wmctrl -lx | dmenuy -i -l 15 )
wmctrl -i -a ${str:0:10}

