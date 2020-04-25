#!/usr/bin/expect

set gateway 10.5.30.254
set network 30
set mask 24
set ip_serv 192.168.56.101

spawn telnet $ip_serv 5003
send "\r"
expect ">"
send "set pcname dns\r"
expect ">"
send "ip 10.5.$network.11/$mask $gateway\r"
expect ">"
send "save\r"
expect "dns>"
send "\x1D"
expect "telnet>"
send "quit"

spawn telnet $ip_serv 5005
send "\r"
expect ">"
send "set pcname web\r"
expect ">"
send "ip 10.5.$network.12/$mask $gateway\r"
expect ">"
send "save\r"
expect "web>"
send "\x1D"
expect "telnet>"
send "quit"