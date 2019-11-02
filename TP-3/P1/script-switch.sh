#!/bin/bash

( echo ; echo ; echo -e 
sleep 1
echo -e "conf t"
sleep 1
echo -e "hostname SW1"
sleep 1
echo -e "vlan 10"
sleep 1
echo -e "name net1"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 20"
sleep 1
echo -e "name net2"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 30"
sleep 1
echo -e "name net3"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 40"
sleep 1
echo -e "name netP"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 0/1"
sleep 1
echo -e "switchport"
sleep 1
echo -e "switchport trunk encapsulation dot1q"
sleep 1
echo -e "switchport mode trunk"
sleep 1
echo -e "switchport trunk allowed vlan 10,20,30,40"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 0/0"
sleep 1
echo -e "switchport"
sleep 1
echo -e "switchport trunk encapsulation dot1q"
sleep 1
echo -e "switchport mode trunk"
sleep 1
echo -e "switchport trunk allowed vlan 20,30,40"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 1/1"
sleep 1
echo -e "switchport"
sleep 1
echo -e "switchport mode access"
sleep 1
echo -e "switchport access vlan 10"
sleep 1
echo -e "exit"
sleep 1
echo -e "switchport"
sleep 1
echo -e "interface Ethernet 1/2"
sleep 1
echo -e "switchport mode access"
sleep 1
echo -e "switchport access vlan 20"
sleep 1
echo -e "exit"
sleep 1
echo -e "exit"
sleep 1
echo -e "wr"
sleep 1
echo -e "sh int br" ) | telnet 192.168.56.101 5007

( echo ; echo ; echo -e 
sleep 1
echo -e "conf t"
sleep 1
echo -e "hostname SW2"
sleep 1
echo -e "vlan 10"
sleep 1
echo -e "name net1"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 20"
sleep 1
echo -e "name net2"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 30"
sleep 1
echo -e "name net3"
sleep 1
echo -e "exit"
sleep 1
echo -e "vlan 40"
sleep 1
echo -e "name netP"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 0/1"
sleep 1
echo -e "switchport trunk encapsulation dot1q"
sleep 1
echo -e "switchport mode trunk"
sleep 1
echo -e "swichport trunk allowed vlan 10,20,30,40"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 1/0"
sleep 1
echo -e "switchport mode access"
sleep 1
echo -e "switchport access vlan 30"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 1/3"
sleep 1
echo -e "switchport mode access"
sleep 1
echo -e "switchport access vlan 20"
sleep 1
echo -e "exit"
sleep 1
echo -e "interface Ethernet 2/0"
sleep 1
echo -e "switchport mode access"
sleep 1
echo -e "switchport access vlan 40"
sleep 1
echo -e "exit"
sleep 1
echo -e "exit"
sleep 1
echo -e "wr"
sleep 1
echo -e "sh int br" ) | telnet 192.168.56.101 5005