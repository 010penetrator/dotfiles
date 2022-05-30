#!/bin/bash
# Choose from pdf and djvu files with dmenu. And open it with zathura

source $sh/dmenurc
dirlist="/ln/hh /ln/ff/use /ln/mo/fast/ready/ /ln/ho/use /ln/dwn $HOME/.cache/luakit/viewpdf/ /ln/wo"
targ=$(
( find -L /ln/ho -maxdepth 1 -type f \( -iname "*.pdf" -or -iname "*.djvu" \); \
find -L $dirlist -type f \( -iname "*.pdf" -or -iname "*.djvu" \)) \
| dmenu $DMENU_OPTIONS -fn "$DMENU_FN" )

if [ -n "$targ" ] ; then
    zathura "$targ" &
fi

