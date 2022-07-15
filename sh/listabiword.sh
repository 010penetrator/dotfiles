#!/bin/bash
# Choose from doc files with dmenu. And open it with abiword

source $sh/dmenurc
dirlist="/ln/hh /ln/mob/use /ln/dwn /ln/wo"
targ=$(
( find -L /ln/ho -maxdepth 1 -type f \( -iname "*.doc" -or -iname "*.docx" \)
find -L $dirlist -type f \( -iname "*.doc" -or -iname "*.docx" \) ) | \
    dmenu $DMENU_OPTIONS -fn "$DMENU_FN"
)

if [ -n "$targ" ] ; then
    abiword "$targ" &
fi

