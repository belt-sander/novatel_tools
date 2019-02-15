#!/bin/bash

if [ $# -eq 0 ] 
	then echo "need to specify port number" 
	exit
fi

serialport=/dev/ttyUSB$1

stty -F $serialport 115200 raw -echo   #setup serial port to 115200 on ttyUSB0 (Default)
exec 3<$serialport 
	cd /tmp/
	rm -f ttyDump.dat                    
	cat <&3 > /tmp/ttyDump.dat & #start serial log
	PID=$!
		echo "logfile close" > $serialport
		echo "stopped logging. check that logging LED has stopped blinking!!"
		sleep 0.5s

		echo "log logfilestatus" > $serialport
		echo "log status check"
		sleep 1.0s

		echo "unlogall true" > $serialport
		echo "removed old logging parameters"
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "logging stopped, yo!"
echo ""
