#!/bin/bash
# Relaunch picom

if $(type "resta" &>/dev/null) ; then
    resta "picom" "picom --config $sh/conf/picom.conf"
else
    killall picom
    sleep .5
    picom --config $sh/conf/picom.conf &
fi

