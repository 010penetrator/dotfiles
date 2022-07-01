#!/bin/bash
# Go to desktop or cycle windows at current desktop
# Usage: desk_selector_i3.sh N

echo '.'

curdesk0=$(wmctrl -d | grep '*' | cut -c 1)
curdesk=$(wmctrl -d | grep '*')
curdesk=${curdesk: -1}
echo curdesk is $curdesk alt $curdesk0

if [ $1 == $curdesk ]
then
  curid=$(xprop -root _NET_ACTIVE_WINDOW | cut -d "#" -f2 | cut -c 4-) && while [ ${#curid} -lt 7 ]; do curid=0$curid; done
  echo curid is $curid
  echo "choosing next at this desk"
  if
    #not last in list
    [[ $(wmctrl -l -x | grep "^0x0.......  "$curdesk0 | grep -A1 $curid | wc -l) > 1 ]]
  then
    str=$(wmctrl -l -x | grep "^0x0.......  "$curdesk0 | grep -A1 $curid | tail -1 | cut -c -10)
  else
    str=$(wmctrl -l -x | grep "^0x0.......  "$curdesk0 | head -1 | cut -c -10)
  fi
  wmctrl -i -a $str
else
  # str=$(expr $1 + 1 )
  i3-msg "workspace "$1
fi

