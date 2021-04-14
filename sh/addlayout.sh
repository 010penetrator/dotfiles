#!/bin/bash
# Add RU/EN keyboard input toggle on Alt+Shift press

setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &

