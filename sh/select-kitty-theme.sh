#!/bin/bash
# Sorry, no documentation for this

go_through ()
{
  unset key
  echo
  echo will go through $PWD
  if  ! [[ $( ls -A *.conf 2>/dev/null ) ]] ; then
    echo Theme files not found here!
    exit
  fi
  while (true) ; do 
    if [[ $key == 'i' ]] ; then
      if [[ -d favs ]] && [[ $( ls -A favs/*.conf 2>/dev/null ) ]] ; then
        cd favs
        echo --Entering next level of favourites
      else
        echo --Favs not found! Gonna crawl this list again
      fi
    fi
    #
    echo ------------
    echo Themes are:
    ls -x *.conf
    echo ------------
    echo current theme is $(readlink /ln/co/kitty/theme.conf)
    echo
    #
    for t in *.conf
    do
      unset key
      echo $t
      kitty @ set-colors -a "$PWD/$t"
      read -rsn 1 key
      [[ $key == 'f' ]] && mkdir -p favs && cp "$t" "favs/$t"
      [[ $key == 'd' ]] && mkdir -p del && mv "$t" "del/$t"
      [[ $key == 'q' ]] && exit
      [[ $key == 'i' ]] && break
      [[ $key == 'b' ]] && break
      [[ $key == 'a' ]] && ln -srf "$t" ~/.config/kitty/theme.conf && echo --Applied!
    done 
    echo
  done
}

echo key commands are : f d q a i b 
cd ~/.config/kitty-themes/themes/ && go_through

