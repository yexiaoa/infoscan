#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 11 16:45:12 2018

@author: root
"""
import sys
import nmap
nm=nmap.PortScanner()
portinfo='/home/eye/722/8'
ziduan='property'
f=open( portinfo ,'w')
sys.stdout=f
ip=sys.argv[1]
nm.scan(hosts=ip,arguments='-sV')
for proto in nm[ip].all_protocols():
    lport=nm[ip][proto].keys()
    lport.sort()
    for port in lport:
        dict1=nm[ip][proto][port]
        dict1['ip']=ip
	dict1['port']=port
        print("{'%s':%s}" %(ziduan, dict1))
