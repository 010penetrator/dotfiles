#!/bin/bash
# Abandoned polybar rc

killall polybar
w=$(ip link | grep state\ UP | cut -f 2 -d ':' | cut -b 2-)
echo $w

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m NETID=$w polybar --config=.sh/polybar.ini --reload top &
  done
else
  polybar --config=.sh/polybar.ini --reload top &
fi

# killall polybar ; polybar --config=.sh/polybar.ini top &

