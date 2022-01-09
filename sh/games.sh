#!/bin/bash
# My games launcher!

source $sh/dmenurc.sh
targ=$( echo -e "Noita\nQuake3\nBrogue" | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )

# targ="Noita"
if [ $targ ] ; then
  # notify-send $targ
  # echo targ is $targ
  case "$targ" in
    Noita)
      # notify-send 1
      cd /ln/ho/gog/Noita
      wine noita.exe
    ;;
    Quake3)
      notify-send 2
    ;;
    *)
      # echo 9 ; echo 10
    ;;
  esac
fi

