#!/bin/bash

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.3.10.16/24 10.3.10.254"
sleep 2
echo "set pcname PC1"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5001

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.3.20.2/24 10.3.20.254"
sleep 3
echo "set pcname PC2"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5002

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.3.20.3/24 10.3.20.254"
sleep 3
echo "set pcname PC3"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5016

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.3.30.4/24 10.3.30.254"
sleep 3
echo "set pcname PC4"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5010

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.3.40.1/24 10.3.40.254"
sleep 3
echo "set pcname P1"
sleep 1
echo "save"
sleep 1
echo "quit" ) | telnet 192.168.56.101 5013
