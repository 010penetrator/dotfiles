#!/bin/bash

source /ln/ho/.sh/dmenurc
list=$( ls /ln/dwn/*.torrent | dmenuy )
echo $list
[[ -n list ]] && mv "$list" /ln/ho/.rtorrent/watch/red/

