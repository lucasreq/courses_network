#!/bin/bash

telnet 192.168.56.101 5010 <<EOF

conf t
interface ethernet 0/0.10
encapsulation dot1q 10
ip address 10.3.10.254 255.255.255.0
exit

interface ethernet 0/0.20
encapsulation dot1q 20
ip address 10.3.20.254 255.255.255.0
exit

interface ethernet 0/0.30
encapsulation dot1q 30
ip address 10.3.30.254 255.255.255.0
exit

interface ethernet 0/0.40
encapsulation dot1q 40
ip address 10.3.40.254 255.255.255.0
exit

interface Ethernet 0/0
no shut
exit
exit

wr

EOF