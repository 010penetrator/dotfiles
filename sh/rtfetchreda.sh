
source /ln/ho/.sh/dmenurc.sh
list=$(ls /ln/dwn/*.torrent | dmenu $DMENU_OPTIONS -fn "$DMENU_FN")
echo $list 
[[ -n list ]] && mv "$list" /ln/ho/.rtorrent/watch/red/

