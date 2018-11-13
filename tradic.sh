#!/bin/sh

trafic=/home/eye/722/trafic
tmp=/home/eye/722/tmp
tmp1=/home/eye/722/tmp1
dst=/home/eye/722/look1
ifconfig | grep "字节" >$trafic
cat $trafic | while read line
    do echo "{'traficinfo':'$line'}" >> $tmp
done
cat $tmp |tr "'" "*" > $tmp1
cat $tmp1 |tr '*' '"' >> $dst
rm -r $tmp
