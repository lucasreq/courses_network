#!/usr/bin/expect

set n 0
set gateway 10.5.10.254
set network 10
set mask 24
set ip_serv 192.168.56.101
set list_port [list 5010 5014 5018]
foreach port $list_port {
    set n [expr {$n + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "set pcname ADMIN$n\r"
    expect ">"
    send "ip 10.5.$network.1$n/$mask $gateway\r"
    expect ">"
    send "save\r"
    expect "ADMIN$n>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}