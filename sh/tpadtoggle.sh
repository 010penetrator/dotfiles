# Toggle touchpad 

device=12
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ $state == '1' ];then
  xinput --disable $device
else
  xinput --enable $device
fi

xdotool mousemove 1600 000

