#!/bin/bash

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.5.20.11/24 10.5.20.254"
sleep 2
echo "set pcname GUEST1"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5012

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.5.20.12/24 10.5.20.254"
sleep 3
echo "set pcname GUEST2"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5016

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.5.20.13/24 10.5.20.254"
sleep 3
echo "set pcname GUEST3"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5020

( echo ; echo ; echo -e 
sleep 2
echo "ip 10.5.20.253/24 10.5.20.254"
sleep 3
echo "set pcname dhcp"
sleep 1
echo "save"
sleep 1
echo "quit"  ) | telnet 192.168.56.101 5022