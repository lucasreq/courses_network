#!/usr/bin/expect

set n 0
set gateway 192.168.40.6
set network 40
set mask 29
set ip_serv 192.168.56.101
set list_port [list 5058 5040 5054]
foreach port $list_port {
    set n [expr {$n + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "set pcname A$n\r"
    expect ">"
    send "ip 192.168.$network.$n/$mask $gateway\r"
    expect ">"
    send "save\r"
    expect "A$n>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}