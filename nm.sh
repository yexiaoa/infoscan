#!/bin/sh

snmpfile=/home/eye/722/test.log
snmpdstf=/home/eye/722/spf
onesixtyone $1 -o $snmpfile 1> /dev/null
#spinfo=$(sed -n 1p $snmpfile)
#judge whethere the file is exist?
#echo "{'snmpinfo':'$spinfo'}" >> $spdstf
if [ -s $snmpfile ]; then
spinfo=$(sed -n 1p $snmpfile)
echo "{'snmpinfo':'$spinfo'}" >> $snmpdstf
fi


