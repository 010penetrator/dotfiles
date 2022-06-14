#!/bin/bash
# Set X pointer (mouse) linear mode and set velocity

entry=$(xinput  list | grep -e 'slave *pointer' | sed -e 's/^[^[:alpha:]]*//' -e 's/ *\[.*]//' | fzf)
id=$(echo $entry | sed -e 's/^[^=]*//' | cut -d '=' -f2-)

[[ $id =~ [^0-9] ]] && echo insane id! exiting! && exit

echo Setting flat accel profile for \ \ \ $entry
xinput set-prop $id "libinput Accel Profile Enabled" 0, 1 && echo Success! || echo Fail!

echo Please enter desired velocity
read velo
# [[ $id =~ [^0-9,-,+,.] ]] && echo try range from -0.99 to .99
xinput set-prop $id "libinput Accel Speed" $velo

