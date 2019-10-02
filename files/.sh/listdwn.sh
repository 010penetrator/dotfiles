. ~/.sh/dmenurc.sh
f=$(ls -t /ln/dwn | dmenu $DMENU_OPTIONS)
[ -z "$f" ] || xdg-open /ln/dwn/"$f"

