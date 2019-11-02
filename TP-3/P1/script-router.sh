#!/bin/bash

( echo ; echo ; echo -e 

sleep 3
echo -e "conf t\r"
sleep 1
echo -e "interface ethernet 0/0.10\r"
sleep 1
echo -e "encapsulation dot1q 10\r"
sleep 1
echo -e "ip address 10.3.10.254 255.255.255.0\r"
sleep 1
echo -e "exit\r"

echo -e "interface ethernet 0/0.20\r"
sleep 1
echo -e "encapsulation dot1q 20\r"
sleep 2
echo -e "ip address 10.3.20.254 255.255.255.0\r"
sleep 3
echo -e "exit\r"

echo -e "interface ethernet 0/0.30\r"
sleep 1
echo -e "encapsulation dot1q 30\r"
sleep 2
echo -e "ip address 10.3.30.254 255.255.255.0\r"
sleep 3
echo -e "exit\r"

echo -e "interface ethernet 0/0.40\r"
sleep 1
echo -e "encapsulation dot1q 40\r"
sleep 2
echo -e "ip address 10.3.40.254 255.255.255.0\r"
sleep 3
echo -e "exit\r"

echo -e "interface Ethernet 0/0\r"
sleep 2
echo -e "no shut\r"
sleep 1
echo -e "exit\r"
echo -e "exit\r"

echo -e "wr\r" ) | telnet 192.168.56.101 5015