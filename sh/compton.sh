#!/bin/sh
# Relaunch compton

killall compton; compton -b --config .sh/compton.conf

