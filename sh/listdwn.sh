#!/bin/bash

source $sh/dmenurc
f=$(ls -t /ln/dwn | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
[ -z "$f" ] || xdg-open /ln/dwn/"$f"

