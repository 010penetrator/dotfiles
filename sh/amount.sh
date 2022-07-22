#!/bin/bash
# Mount block device with udevil and dmenu.

source $sh/dmenurc
SELECTOR="dmenuy"

LSBLK="lsblk"
# NAME,FSTYPE,LABEL,FSUSE%,FSSIZE,MOUNTPOINT
target=$( $LSBLK -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT | grep -e ".sd\|.nvme" |
     $SELECTOR |
     cut -f 1 -d " " | tr -cd '[:alnum:]' )
if [ ! -z "${target}" ]; then
    udevil mount /dev/$target 2>&1 | tee /tmp/vil1
    if [ ${PIPESTATUS[0]} -eq "0" ]; then
        echo "/dev/$target mounted"
        mopoint=$(findmnt /dev/${target} -o TARGET -n)
        [[ -d mopoint ]] && touch -c "$mopoint" && return 0
    fi
    notify-send "$(cat /tmp/vil1)"
else
    echo "No target!"
fi
