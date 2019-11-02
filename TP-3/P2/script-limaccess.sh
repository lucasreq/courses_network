#!/usr/bin/expect

set i 0
set gateway 192.168.20.14
set network 120
set mask 28
set ip_serv 192.168.56.101
set list_port [list 5018 5020 5034 5036 5038 5066 5072 5074]
foreach port $list_port {
    set i [expr {$i + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "set pcname S$i\r"
    expect ">"
    send "ip 192.168.$network.$i/$mask $gateway\r"
    expect ">"
    send "save\r"
    expect "S$i>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}