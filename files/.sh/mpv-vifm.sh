# Script to launch vifm on current file/directory. I call it via a hotkey from mpv. 

echo "$1"
a="$1"
[ -d "$a" ] || a="${a%/*}"
# if [ -n $VIM_SERVERNAME ]
# then
#   vimterm "cd \"$PWD\"; vifm \"$a\" &> /dev/null; exit"
# else
# i3-msg split v
cd "$a"
case $TERMINAL in
  kitty)
    kitty /bin/bash -c "vifm . -c \:only" & ;; 
  *)
    xterm -e "vifm . -c \:only" &> /dev/null ;;
esac
# fi

