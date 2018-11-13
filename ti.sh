#!/bin/bash

tidb=/home/eye/722/uniq_threat
tidstf=/home/eye/722/tidstf
dstf=/home/eye/722/look1
temp=/home/eye/722/titmp
x=$(($RANDOM%1000))
ti=$(sed -n $(echo $x)P $tidb)
echo "{'threatinfo':'$ti'}" > $tidstf
cat $tidstf |tr "'" "*" > $temp
cat $temp |tr '*' '"' >> $dstf
