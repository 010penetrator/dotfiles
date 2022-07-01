#!/bin/bash

for f in /ln/dwn/*.torrent ; do
    echo .
    echo "$f"
    transmission-remote 9090 -a "$f" && sleep 0.5 && mv "$f" ~/.del/
done

