#!/bin/bash

mulu=/home/eye/722
#
# vulnarablity scan
for script in $(cat $mulu/test.vuln)
    do
	nmap --script=$script $1 >> $mulu/lost
	grep "VULNERABLE" $mulu/lost > /dev/null
	if [ $? -eq 0 ]; then
		echo $script >> $mulu/$1
	fi
	rm -r $mulu/lost		 
done
destfile=/home/eye/722/vulnlook
DIR=$mulu/$1
	if [ -e $DIR ]; then
		for vuln_name in $(cat $DIR)
		    do
			case $vuln_name in
			    "rdp-vuln-ms12-020.nse") 
			    echo "{'vuln':{'ip':'$1','vuln_msg':'远程桌面漏洞'}}" >>$destfile
			    ;;
			    "smb-vuln-ms17-010.nse")
			    echo "{'vuln':{'ip':'$1','vuln_msg':'永恒之蓝漏洞'}}" >>$destfile
			    ;;
			    "http-vuln-cve2015-1635.nse")
			    echo "{'vuln':{'ip':'$1','vuln_msg':'远程溢出'}}" >>$destfile
			    ;;
			    "http-iis-short-name-brute.nse")
			    echo "{'vuln':{'ip':'$1','vuln_msg':'iis短文件'}}" >>$destfile
			    ;;

			esac
		    done
		rm -r $DIR

	fi

