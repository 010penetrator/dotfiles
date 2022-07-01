#!/bin/bash

source $sh/dmenurc
cat .mus-library | sort -R | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" | while read line; do 
    deadbeef --queue "$line"; done

