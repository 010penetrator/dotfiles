#!/bin/bash
# I used that to transit torrents directory across different Transmission versions

name=$(transmission-show "$1" | grep ^Name: | cut -c 7-)
hash=$(transmission-show "$1" | grep " Hash: " | cut -c 9-24)
echo $name
mv "$1" "$name"."$hash".torrent

