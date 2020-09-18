. $sh/dmenurc.sh
LSBLK="lsblk"
target=$( $LSBLK -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT | grep .sd | grep '/' | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" | cut -f 1 -d " " | tr -cd '[:alnum:]' )
[ ! -z "${target}" ] && sync && ( udevil umount /dev/$target &> /tmp/vil2 && notify-send "/dev/$target unmounted" || notify-send "$(cat /tmp/vil2)" )

