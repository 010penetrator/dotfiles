#!/bin/bash
# My games launcher!

source $sh/dmenurc
targ=$( echo -e "Noita\nQuake3\nBrogue" | dmenuy )

# targ="Noita"
if [ $targ ] ; then
  # notify-send $targ
  # echo targ is $targ
  case "$targ" in
    Noita)
      # notify-send 1
      # cd "/ln/ho/Games/gog/noita/drive_c/GOG Games/Noita/"
      path=$(realpath "/ln/ho/.wine/drive_c/GOG Games/Noita")
      export WINEPREFIX="$path"
      export WINEARCH=win32
      export WINEPATH="$path"
      cd "$path"
      wine noita
    ;;
    Quake3)
      notify-send 2
    ;;
    *)
      # echo 9 ; echo 10
    ;;
  esac
fi

