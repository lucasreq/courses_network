#!/usr/bin/expect

spawn telnet 192.168.56.101 5042
send "\r"
expect ">"
send "set pcname srv1\r"
expect ">"
send "ip 192.168.60.1/29 192.168.60.6\r"
expect "srv1>"
send "save\r"
expect "srv1>"
send "\x1D"
expect "telnet>"
send "quit"

spawn telnet 192.168.56.101 5052
send "\r"
expect ">"
send "set pcname srv6\r"
expect ">"
send "ip 192.168.60.2/29 192.168.60.6\r"
expect "srv6>"
send "save\r"
expect "srv6>"
send "\x1D"
expect "telnet>"
send "quit"