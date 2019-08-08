. ~/.sh/dmenurc.sh
d=$(cat .mus-list | sort -R | dmenu $DMENU_OPTIONS)
# echo $d;
if [ -z "$d" ]; then echo no selection !; exit; fi
case $(echo "$d" | wc -l) in
	0)
		echo noth
		;;
	1)
		cd "$d"
		pwd
    case $TERMINAL in
      kitty)
        kitty /bin/bash -c "mpv-album ." &> /dev/null & ;;
      *)
        xterm -xrm 'XTerm.vt100.allowTitleOps: true' -geometry 60x24+400+250 -e 'mpv-album .'  &> /dev/null & ;;
    esac
		;;
	*)
		echo "$d" | while read l; do 
			cd "$l"
			xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "$l - MPV" -geometry 60x24+400+250 -e mpv --pause --no-video . &> /dev/null &
		done
		;;
esac

