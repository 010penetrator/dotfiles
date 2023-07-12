#!/bin/bash
# See cool spectrogram of an audiofile
# Needs 'sox' & 'feh'

sox "$1" -n remix 2 spectrogram -x 900 -y 550 -o/tmp/spec.png -p2 -t "$1" ; feh -B black /tmp/spec.png &>/dev/null
# rm /tmp/spec.png

