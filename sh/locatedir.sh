#!/bin/bash
# Locate directories with 'locate'

locatedir () {
    locate -i "$*" | while read line
do 
    if [ -d "$line" ] ; then echo $line ; fi
done
}

#exp=$(echo "$*" | tr '[:lower:]' '[:upper:]')

locatedir "$*" | sort | while read line ; do
#echo $line
#last=$(echo ${line##*/} | grep -i "$*")
#echo $last
if [[ $(echo ${line##*/} | grep -i "$*") ]] ; then echo "$line" ; fi
done

