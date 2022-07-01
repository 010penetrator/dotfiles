#!/bin/bash

for f in /ln/dwn/*.torrent ; do
    echo .
    echo "$f"
    transmission-remote 9090 -a -w /ln/torrents/red "$f" && sleep 0.5 && mv "$f" /ln/torrents/red/.torrents-new/
done

