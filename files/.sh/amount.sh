. $sh/dmenurc.sh

# NAME,FSTYPE,LABEL,FSUSE%,FSSIZE,MOUNTPOINT 
target=$( sudo lsblk -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT | grep .sd | dmenu $DMENU_OPTIONS | cut -f 1 -d " " | tr -cd '[:alnum:]' )
echo $target
if [ ! -z "${target}" ] ; then
    udevil mount /dev/$target &> /tmp/vil1 
    notify-send "$(cat /tmp/vil1)"
    # udevil mount /dev/$target 2>&1
    # udevil mount /dev/$target
fi

