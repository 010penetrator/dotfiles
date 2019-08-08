. $sh/dmenurc.sh
d=$(tac /tmp/mpv-history | dmenu $DMENU_OPTIONS)
if [ -z "$d" ]; then echo no selection !; exit; fi
cd "$d"
echo $d
xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "$d -- mpv" -geometry 60x24+400+250 -e 'mpv-album --no-video .' &> /dev/null &

