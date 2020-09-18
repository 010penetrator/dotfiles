title() { echo -ne "\033]0;$*\007"; }
export -f title
$TERMINAL -e sh -c " title transmission-remote_local_ ; transmission-remote-cli -c localhost:9090 "

