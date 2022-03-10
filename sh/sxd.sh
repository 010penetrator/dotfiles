#!/bin/bash
# Reload sxhkd silently

killall sxhkd; sxhkd -c  /ln/sh/conf/sxhkdrc 1>/dev/null &
# notify-send TERMINAL "$TERMINAL" #debug

