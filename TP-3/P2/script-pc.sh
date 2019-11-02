#!/usr/bin/expect

set i 0
set gateway 192.168.10.30
set network 10
set mask 27
set ip_serv 192.168.56.101
set list_port [list 5000 5005 5009 5007 5012 5015 5024 5032 5026 5028 5064 5060 5068 5070 5076 5080]
foreach port $list_port {
    set i [expr {$i + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "ip 192.168.$network.$i/$mask $gateway\r"
    expect ">"
    send "set pcname PC$i\r"
    expect ">"
    send "save\r"
    expect "PC$i>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}