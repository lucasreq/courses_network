#!/usr/bin/expect

set i 0
set gateway 192.168.30.14
set network 30
set mask 28
set ip_serv 192.168.56.101
set list_port [list 5022 5030 5062 5078 5056]
foreach port $list_port {
    set i [expr {$i + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "ip 192.168.$network.$i/$mask $gateway\r"
    expect ">"
    send "set pcname P$i\r"
    expect ">"
    send "save\r"
    expect "P$i>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}