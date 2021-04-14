#!/bin/bash
# Send paths from stdin to deadbeef

while read line ; do deadbeef --queue "$line" ; done 

