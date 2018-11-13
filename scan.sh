#!/bin/bash


echo -n "Your choice: "
read choice
iplist=/home/eye/722/6
pydir=/home/eye/722/1.py    #port
shdir=/home/eye/722/test.sh #vuln
snmp=/home/eye/722/nm.sh    #ICS
trafic=/home/eye/722/tradic.sh #trafic
portinfo=/home/eye/722/8
tempfile=/home/eye/722/temp
snmpdstf=/home/eye/722/spf
destfile=/home/eye/722/look1
vulndstf=/home/eye/722/vulnlook
ti=/home/eye/722/ti.sh
bash $ti
fping -ag $choice 1> $iplist 2> /dev/bull
for ip in $(cat $iplist)
    do
	bash $snmp $ip
	python $pydir $ip
	cat $portinfo |tr "'" "*" > $tempfile
	cat $tempfile |tr '*' '"' >> $destfile
	bash $shdir $ip
done
bash $trafic
if [ -e $snmpdstf ];then
	cat $snmpdstf |tr "'" "*" > $tempfile
	cat $tempfile |tr '*' '"' >> $destfile
	rm -r $snmpdstf
fi
if [ -e $vulndstf ];then
	cat $vulndstf |tr "'" "*" > $tempfile
	cat $tempfile |tr '*' '"' >> $destfile
	rm -r $vulndstf
fi



