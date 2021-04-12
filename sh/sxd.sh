#!/bin/bash
# Reload sxhkd

killall sxhkd; sxhkd -c  ~/.sh/sxhkdrc &
# notify-send TERMINAL "$TERMINAL" #debug
