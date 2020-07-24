#!/bin/bash

# Usage
# ./flash.sh path/to/your.hex

TARGET=$1

ls /dev/tty* > /tmp/1

echo "Reset your Pro Micro now"

while [[ -z $USB ]]; do
  sleep 1
  ls /dev/tty* > /tmp/2
  USB=`diff /tmp/1 /tmp/2 | grep -o '/dev/tty.*'`
done

sleep 1

# stty -F $USB speed 1200 
# stty -F $USB speed 9600 
# stty -F $USB speed 115200 

avrdude -p atmega32u4 -c avr109 -P $USB -U flash:w:$TARGET
# avrdude -p m32U4 -c avr109 -P $USB -U flash:w:$TARGET
