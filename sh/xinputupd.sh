#!/bin/bash
# Set setups for my Kensington trackball

xinput | grep "Kensington Orbit Fusion" -m2 | tail -2 | \
    while read line ; do
        unset id
        id=$( echo ${line#*id=} | cut -d ' ' -f 1 )
        echo 'Kensington id probably is' $id '; trying to set acceleration..'
        if [ -n "$id" ]
        then
            # Now we know the thing's probable id, do the setups
            xinput set-prop $id "libinput Accel Profile Enabled" 0, 1 
            xinput set-prop $id "libinput Accel Speed" -.1
        fi
    done

