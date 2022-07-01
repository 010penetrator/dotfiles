#!/bin/bash
# Select and open a file from Downloads/

source $sh/dmenurc
SEL=$(ls -t /ln/dwn | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")

[[ -z "$SEL" ]] && exit
xdg-open /ln/dwn/"$SEL"

