#!/bin/bash
# search at yandex.ru
$BROWSER https://www.yandex.ru/search/?text="$*" &>/dev/null 
# raise.sh $BROWSER ' '

