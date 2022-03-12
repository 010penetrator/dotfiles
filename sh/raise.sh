#!/bin/bash
# My run-or-raise window script
# Usage: 'raise.sh classname-or-windowname [start command]'
# Try 'wmctrl -l -x' to discover the names
# wmctrl required

# DEBUG=1
[[ $DEBUG == '1' ]] && echo '.'
activeid=$(xprop -root _NET_ACTIVE_WINDOW | cut -d "#" -f2 | cut -c 4-) &&
# drop '0x0'
activeid=$(echo $activeid | cut -d ',' -f1)
# zero pad it
while [ ${#activeid} -lt 7 ] ; do activeid=0$activeid; done
[[ $DEBUG == '1' ]] && echo activeid is $activeid
if [ "$1" == '0' ]
# if argument is null, cycle through windows of same class as current
then 
  wname=$(wmctrl -l -x | grep -a $activeid | cut -d " " -f4 | cut -d "." -f1)
  echo focus another $wname
else
  wname=$1
  # if [ -z "$1" ] ; then echo "Please, provide argument"; exit 1 ; fi
  # if [ -z "$1" ] ; then wname="543yhv89nt7u8h43q34q8gh" ; fi # to select no candidate
fi

if [ -n "$1" ] ; then
  if
    # If window of that name is active, there are others of that name, current is not last in list
    [[ $(wmctrl -l -x | grep -a "$wname" | grep -a $activeid) ]] &&
    [[ $(wmctrl -l -x | grep -a -v -e "^.\{9\}\s" | grep -a "$wname" | wc -l) > 1 ]] &&
    # [[ $(wmctrl -l -x | grep -a $wname | wc -l) != $(wmctrl -l -x | grep -a $wname | grep -a -n $activeid | cut -d ":" -f1) ]]
    [[ $(wmctrl -l -x | grep -a "$wname" | grep -a -A1 $activeid | wc -l) > 1 ]]
  then
    # Choose next window of same name
    echo "choosing next"
    str=$(wmctrl -l -x | grep -a -v -e "^\{9\}\s" | grep -a "$wname" | grep -a -A1 $activeid | tail -1 | cut -c -10)
  else
    # Just choose window which includes desired name
    echo "choosing simple"
    str=$(wmctrl -l -x | grep -a -v -e "^\{9\}\s" | grep -a -m 1 "$wname" | cut -c -10)
  fi
fi

[[ $DEBUG == '1' ]] && echo Final aim $str
if [ -z "$str" ]
  then
    if [ -n "$2" ]
      #Exec
      then
        eval " source $HOME/.bashrc ; $2 " &> /dev/null &
      else
        $wname &> /dev/null &
    fi
  else wmctrl -i -a $str 1>/dev/null
fi

