. $sh/dmenurc.sh
cat .mus-list |	sort -R | dmenu $DMENU_OPTIONS -fn "$DMENU_FN" | while read line; do 
    deadbeef --queue "$line"; done

