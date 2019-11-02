#!/usr/bin/expect

set ip 0
set i 1
set gateway 192.168.50.6
set network 50
set mask 29
set ip_serv 192.168.56.101
set list_port [list 5044 5046 5048 5050]
foreach port $list_port {
    set i [expr {$i + 1}]
    set ip [expr {$ip + 1}]
    spawn telnet $ip_serv $port
    send "\r"
    expect ">"
    send "set pcname srv$i\r"
    expect ">"
    send "ip 192.168.$network.$ip/$mask $gateway\r"
    expect ">"
    send "save\r"
    expect "srv$i>"
    send "\x1D"
    expect "telnet>"
    send "quit"
}