#!/bin/bash
up="Hi"
since="Hello"
echo $up
echo $since
show_up_time(){
	local up=$(uptime -p | cut -c4-)
	local since=$(uptime -s)
	cat << EOF
-----
This machine has been up for ${up}
It has been running since ${since}
-----
EOF
}
show_up_time
echo $up
echo $since
