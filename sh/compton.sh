#!/bin/sh
# Relaunch compton

killall compton
sleep .5
compton --config $sh/conf/compton.conf
# compton -b --config $sh/conf/compton.conf

