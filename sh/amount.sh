#!/bin/bash
# Mount block device with udevil and dmenu.

[[ -z $SELECTOR ]] && SELECTOR="dmenu" && source $sh/dmenurc && SELECTOR="dmenuy"

LSBLK="lsblk"
# NAME,FSTYPE,LABEL,FSUSE%,FSSIZE,MOUNTPOINT
target=$( $LSBLK -o TYPE,NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT -l | grep "part" | cut -f 2- -d " " | 
     $SELECTOR | cut -f 1 -d " " )
if [[ ! -z target ]]; then
    udevil mount /dev/$target 2>&1 | tee /tmp/vil-mo
    if [ ${PIPESTATUS[0]} -eq "0" ]; then
        echo "/dev/$target mounted"
        mopoint=$(findmnt /dev/${target} -o TARGET -n)
        [[ -d mopoint ]] && touch -c "$mopoint"
    fi
    notify-send "$(cat /tmp/vil-mo)"
else
    echo "No target!"
fi

