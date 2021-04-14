#!/bin/bash

[ -z "$1" ] && set -- "VIM"
TITLE=$1
# echo TITLE= $TITLE #Debug
kitty_hits=''
KittyMomHasFocus=0
activ_xwin_id=$(xprop -root _NET_ACTIVE_WINDOW | cut -d "#" -f2 | cut -c 2-)
activ_xwin_id="0x0"$(printf "%07x" "$activ_xwin_id") 
kitty_mom_pid=$( ps ax -o pid:1,cmd | grep "kitty_ear" | grep -v grep | cut -d' ' -f1 )
# echo mom $kitty_mom_pid #Debug
[ -z $kitty_mom_pid ] && kitty_mom_pid=NONE111 && echo No kitty_mom! || 
kitty_hits=$(kitty @ --to unix:/tmp/kitty_ear ls | jq --arg TITLE "$TITLE" '[ .[].tabs[].windows[] | del(.env[]) | {id,is_focused,title} | select(.title|test($TITLE)) ] ')
# echo kitty_hits $kitty_hits #Debug

buf=''
while read line ; do
  read xwin_id xwin_pid  < <(echo $line | cut -d' ' -f1,3) 
  # Make json list of both in-kitty and common xwindow instances matching $TITLE 
  if [ "$xwin_pid" == "$kitty_mom_pid" ] ; then
    # This is kitty-mom Xwindow
    # Insert in-kitty matches instead of kitty-mom xwindow entry
    if [ "$xwin_id" == "$activ_xwin_id" ] ; then 
      # This Xwindow is focused
      KittyMomHasFocus=1
      buf+=$(echo $kitty_hits | jq  '.[]')
    else
      # This Xwindow is not focused 
      # Don't describe in-kitty windows as focused
      buf+=$(echo $kitty_hits | jq  '.[] | del(.is_focused)')
      # Save id for later
      kitty_mom_xwin_id="$xwin_id"
    fi
  else
    # Create json entry for an xwindow
    [ "$activ_xwin_id" == "$xwin_id" ] && isfo=true || isfo=false
    buf+=$(jq -n --arg xwin_id "$xwin_id" --arg xwin_pid "$xwin_pid" --arg is_focused "$isfo" '{$xwin_id,$xwin_pid,$is_focused}')
  fi
done < <(wmctrl -lxp | grep -e "$TITLE\| $kitty_mom_pid ")

# echo $buf | jq '.' #Debug
i=$( echo $buf | jq -s ' [ . | map({is_focused}) | .[] | .[] | tostring ] | index("true") ' )
len=$(echo $buf | jq -s ' length ')

# echo $i '/' $len  #Debug
[ $len == 0 ] && No hits! Exiting. && exit 

if [ $i == "null" ] || [ $((i+1)) == $len ] ; then 
  i=0
else
  i=$((i+1))
fi
# echo target $i #Debug

ent=$( echo $buf | jq --arg i "$i" -s ' .[$i|tonumber] ' ) 
# echo $ent #Debug
if [ "true" == $(echo $ent | jq ' has("id") ') ] ; then 
  echo kitty raise
  # Raise kitty  
  [ $KittyMomHasFocus -eq 1 ] && echo Assuming kitty is already active 
  [ $KittyMomHasFocus -eq 0 ] && ![ -z "$kitty_mom_xwin_id" ] && wmctrl -i -a "$kitty_mom_xwin_id" 
  kitty @ --to unix:/tmp/kitty_ear focus-window --match id:"$(echo $ent | jq '.id')"
else
  if [ "true" == $(echo $ent | jq ' has("xwin_id") ') ] ; then
    echo x raise
    wmctrl -i -a $(echo $ent | jq '.xwin_id' | tr -cd [:alnum:] )
  else
    echo PANIC!
  fi
fi


