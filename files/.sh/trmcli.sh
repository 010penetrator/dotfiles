title() { echo -ne "\033]0;$*\007"; }
export -f title
$TERMINAL -e sh -c " title transmission-remote-cli; transmission-remote-cli -c localhost:9090 "

