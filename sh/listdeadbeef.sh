#!/bin/bash

source $sh/dmenurc
cat .mus-library | sort -R | dmenuy | while read line; do
    deadbeef --queue "$line"; done

