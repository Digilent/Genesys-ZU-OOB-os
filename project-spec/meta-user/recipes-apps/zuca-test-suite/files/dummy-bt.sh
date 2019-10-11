#!/bin/sh

function trap_ctrlc(){
	echo ctrl + c traped;
	for job in $(jobs -p); do #stop all background jobs for this tool
		echo kill $job && kill "$job"
	done
	exit 0;
}

trap "trap_ctrlc" 2;

zuca_serial=$1

stty -F $zuca_serial 115200 cs8 -cstopb -parenb -echo
#
echo BT-RUNNING

while read response; do echo RX:$response; done < $zuca_serial &

echo -e -n "running\r\n" > $zuca_serial;

while read command; do echo "$command" > $zuca_serial; done;

