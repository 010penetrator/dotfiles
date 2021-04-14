#!/bin/bash

mypid=$1
idlist=$(xprop -root _NET_CLIENT_LIST)
idlist=${st##*#}
idlist=${st//,}

for i in $idlist ; do
  PID=$(xprop -id $i _NET_WM_PID)
  PID=${PID##*= }
  echo $PID
  [[ "$PID" == "$mypid" ]] && xdotool windowactivate $i && break
done 

