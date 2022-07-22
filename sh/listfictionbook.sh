#!/bin/bash
# Choose with dmenu and open with fbreader

source $sh/dmenurc
dirlist="/ln/hh /ln/mob/use /ln/dwn "
targ=$(
( find -L /ln/ho -maxdepth 1 -type f \( -iname "*.pdf" -or -iname "*.djvu" \)
find -L $dirlist -type f \( -iname "*.fb2" -or -iname "*.mobi" \) ) | \
    dmenuy
)

if [ -n "$targ" ] ; then
    fbreader "$targ" &
fi

