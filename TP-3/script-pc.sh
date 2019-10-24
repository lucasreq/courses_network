#!/bin/bash

telnet 192.168.56.101 5000 <<EOF
sleep 3
ip 10.3.10.16/24 10.3.10.254
set pcname PC1
save
EOF

telnet 192.168.56.101 5002 <<EOF
ip 10.3.20.2/24 10.3.20.254
set pcname PC2
save
EOF

telnet 192.168.56.101 5011 <<EOF
ip 10.3.20.3/24 10.3.20.254
set pcname PC3
save
EOF

telnet 192.168.56.101 5006 <<EOF
ip 10.3.30.4/24 10.3.30.254
set pcname PC4
save
EOF

telnet 192.168.56.101 5008 <<EOF
ip 10.3.40.1/24 10.3.40.254
set pcname P1
save
EOF