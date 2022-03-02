#!/bin/bash
# Sorry, no documentation for this

go_through () {
  echo
  echo will go through $PWD
  echo key commands are : f d q a
  echo Themes are:
  ls -x *.conf
  echo
  for t in *.conf
  do
    echo $t
    kitty @ set-colors -a "$PWD/$t"
    read -rsn 1 key
    [[ $key == 'f' ]] && mkdir -p favs && cp "$t" "favs/$t"
    [[ $key == 'd' ]] && mkdir -p del && mv "$t" "del/$t"
    [[ $key == 'q' ]] && break
    [[ $key == '' ]] && echo CR
    [[ $key == 'a' ]] && cp -f $t ~/.config/kitty/theme.conf && exit
  done 
  echo
  if [ -d favs ] && [ "$( ls -A favs/ )" ] ; then
    echo --Entering next level of favourites
    cd favs
  else
    echo --Gonna crawl this list again
  fi
  read -rsn 1 -p $'Press "q" to exit, anykey to go through themes\n' key
  [[ $key == 'q' ]] && return 0
  go_through
}

cd ~/.config/kitty-themes/themes/ && go_through

