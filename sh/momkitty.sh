#!/bin/bash
# Launch kitty that listens

kitty -1 -o allow_remote_control=yes --listen-on unix:/tmp/kitty_ear &
