#!/bin/sh

################### TEST CALLS BEGIN ##########################
test_running(){
	echo ":TEST IF BOARD IS RUNNING >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
	tx_req "running";
	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<:TEST IF BOARD IS RUNNING"
	echo;
}

test_uio_bench() {
	echo ":TEST UIO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>";
	ledN=4
	for i in `seq -s " " 0 $ledN`; do
		tx_req led $i;
	done

	tx_req rgb_led;
	tx_req led 0;

	echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<:TEST UIO"
	echo;
}
################### TEST CALLS END ############################



##############TESTE ENGINE BEGIN ##########################
lock_file=/tmp/tx.lock
sif="$IFS"
function trap_ctrlc(){
	echo ctrl + c traped;
	for job in $(jobs -p); do #stop all background jobs for this tool
		echo kill $job && kill "$job"
	done
	if [ -f $lock_file ]; then
		rm $lock_file;
	fi
	IFS="$sif"
	exit 0;
}

trap "trap_ctrlc" 2;

wait_speed=0.1;
wait_tx_ready(){
	while [ -f $lock_file ]; do
		sleep $wait_speed;
	done
}


tx_req() {
	reqa=( $@ );
	IFS=" "
	req=${reqa[*]};
	echo TX: $req
	#return 0;
	if [ -f $lock_file ]; then
		echo ERR: waiting for command;
	else
		touch $lock_file;
		echo -e -n ${req}"\r\n" > $zuca_serial
	fi
	wait_tx_ready;
}

zuca_serial=$1

rx_rsp(){
	rspa=( $@ );
	IFS=" "
	rsp=${rspa[*]};
	rsp=${rsp//[$'\r\n']} #remove \r\n
	#echo "HEX|RX:"
	#echo $rsp | hexdump -C
	echo RX:$rsp;
	if [ -f $lock_file ]; then
		rm $lock_file;
	fi
}


stty -F $zuca_serial 115200 raw cs8 -cstopb -parenb -echo
while read -r response; do rx_rsp $response; done < $zuca_serial &
echo BT-RUNNING;

#TEST SET BEGIN
test_running;
test_uio_bench;
#TEST SET END

#echo;echo MANUAL MODE:; while read request; do tx_req "$request"; done;
#next line last line in this file is reached only when above line is commented for development
trap_ctrlc
##############TESTE ENGINE END ##########################
