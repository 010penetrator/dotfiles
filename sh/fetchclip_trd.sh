#!/bin/bash

transmission-remote 9090 -a `xclip -o`
transmission-remote 9090 -a `xclip -selection clipboard -o`

