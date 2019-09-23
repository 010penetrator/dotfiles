#!/bin/bash
cd
export PATH=$PATH:~/.sh
# export TERMINAL=$TERMINAL
source ~/.bashrc

# echo `whoami` "@" $PWD @ `date` >> ~/log.t

xrdb merge ~/.sh/Xresources &
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Two-Finger Scrolling" 1 1
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Finger" 80 100 0
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Edge Scrolling" 1 0 0
# xinput set-prop "Clearly Superior Technologies. CST Laser Trackball" "libinput Accel Speed" -.7
# keratin -d &
# xset s 800 800; xset -dpms ; xset dpms 0 0 0
xset dpms 1800 0 0 &
xset s 0 0 &
xset -b &

sxd.sh &
# killall sxhkd; sxhkd -c ~/.sh/sxhkdrc &
nitrogen --restore &

if [[ "$HOSTNAME" =~ 'killer'[pc,PC] ]]; then
  # xrandr --dpi 110x110
  xrdb -merge <(echo "Xft.dpi: 108") &
  # compton.sh &
  # polybar.sh &
  xinput set-prop "RAPOO Rapoo 2.4G Wireless Device" "libinput Accel Speed" -.5 &
  # xinput set-prop "Clearly Superior Technologies. CST Laser Trackball" "libinput Accel Speed" -.7
  sleep 2
  # echo -e 'power on\nquit' | bluetoothctl
  trdwrap.sh &
  polybar.sh &
  killall unclutter; unclutter &
elif [[ "$HOSTNAME" =~ ^debian10pc ]]; then
  # xinput set-prop 12 292 -.6
  # killall unclutter; unclutter &
  # xinput set-prop 12 288 -.6
  # xinput set-prop 10 292 -.6
  xinput set-prop "A4TECH USB Device" "libinput Accel Speed" -.3
  xrandr --output VGA-2 --off 
elif [[ "$HOSTNAME" =~ ^white*(.*)ok ]]; then 
  xset dpms 900 0 0 
  xinput set-prop "SYN1B7F:01 06CB:2991 Touchpad" "libinput Tapping Enabled" 1
elif [[ "$HOSTNAME" =~ 'warmPC' ]]; then
  # xrdb -merge <(echo "Xft.dpi: 108") &
  xinput set-prop "RAPOO Rapoo 2.4G Wireless Device" "libinput Accel Speed" -.5 &
  sleep 1
  trdwrap.sh & 
  earlyoom -m 4 -n &> /dev/null &
  # killall unclutter; unclutter  &
elif [[ "$HOSTNAME" =~ [pc,PC] ]]; then
  xrandr --output VGA-2 --off 
fi

killall dunst
# sleep .9
dunst -conf $HOME/.sh/dunstrc &
# sleep .9
# notify-send $HOSTNAME &

# echo RC done &
notify-send 'RC complete' &

