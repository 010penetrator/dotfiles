#!/bin/bash
# rc script for my systems

cd

desk_height=$(xdpyinfo | grep dimensions | cut -d ' ' -f 7 | cut -d x -f 2)
[[ desk_height -gt 1200 ]] && export HIDPI=1 || export HIDPI=0

source ~/.bashrc

# echo `whoami` "@" $PWD @ `date` >> ~/log.t

# xrdb merge ~/.sh/Xresources &
# setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &

# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Two-Finger Scrolling" 1 1
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Finger" 80 100 0
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Edge Scrolling" 1 0 0
# xinput set-prop "Clearly Superior Technologies. CST Laser Trackball" "libinput Accel Speed" -.7
# xset s 800 800; xset -dpms ; xset dpms 0 0 0
xset dpms 1200 0 0 &
xset s 0 0 &
xset -b &

sxd.sh &
# killall sxhkd; sxhkd -c ~/.sh/sxhkdrc &
nitrogen --restore &

xinput set-prop "A4TECH USB Device" "libinput Accel Speed" -.4
xinput set-prop "LVT ENDGAME GEAR XM1" "libinput Accel Speed" -.5
xinput set-prop "RAPOO Rapoo 2.4G Wireless Device" "libinput Accel Speed" -.7
xinput set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" -.5

if [[ "$HOSTNAME" =~ 'killer'[pc,PC] ]]; then
  # xrandr --dpi 110x110
  xrdb -merge <(echo "Xft.dpi: 108") &
  sleep 2
  # echo -e 'power on\nquit' | bluetoothctl
  trdwrap.sh &
  polybar.sh &
  killall unclutter; unclutter &

elif [[ "$HOSTNAME" =~ 'machine' ]]; then
  xrdb -merge <(echo "Xft.dpi: 108") &
  xrandr --output DP-1 --mode 2560x1440 --rate 120 
  sleep 1
  pgrep transmission-da | grep . || trdwrap.sh & 
  # pgrep earlyoom | grep . || earlyoom -m 2 -n &> /dev/null &

elif [[ "$HOSTNAME" =~ ^debian10pc ]]; then
  xrandr --output DVI-D-0 --auto --left-of HDMI-0
  xrandr --output HDMI-2 --auto --right-of HDMI-1

elif [[ "$HOSTNAME" =~ ^white*(.*)ok ]]; then 
  xset dpms 900 0 0 
  xinput set-prop "SYN1B7F:01 06CB:2991 Touchpad" "libinput Tapping Enabled" 1

elif [[ "$HOSTNAME" =~ 'warmPC' ]]; then
  # xrdb -merge <(echo "Xft.dpi: 108") &
  sleep 1
  pgrep transmission-da | grep . || trdwrap.sh & 
  pgrep earlyoom | grep . || earlyoom -m 2 -n &> /dev/null &

elif [[ "$HOSTNAME" =~ [pc,PC] ]]; then
  xrandr --output VGA-2 --off 
fi

killall dunst
(
sleep .1
if  [[ $HIDPI == "1" ]] ; then
  dunst -conf $HOME/.sh/dunstrc -font "Liberation Mono 14.4" &
else
  dunst -conf $HOME/.sh/dunstrc &
fi
)
# sleep .9
# notify-send $HOSTNAME &

killall osdsh ; osdsh  -p 0 -a 2 -d 1 -f -adobe-helvetica-bold-r-*-*-*-240-*-*-*-*-iso8859-* -c teal 

# echo RC done &
notify-send 'RC complete' &

