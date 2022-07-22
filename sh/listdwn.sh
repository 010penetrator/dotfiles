#!/bin/bash
# Select and open a file from Downloads/

source $sh/dmenurc
SEL=$( ls -t /ln/dwn | dmenuy )

[[ -z "$SEL" ]] && exit
xdg-open /ln/dwn/"$SEL"

