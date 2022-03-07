#!/bin/bash
# Reload sxhkd silent

killall sxhkd; sxhkd -c  $sh/sxhkdrc 1>/dev/null &
# notify-send TERMINAL "$TERMINAL" #debug
