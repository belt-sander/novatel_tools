#!/bin/bash

if [ $# -eq 0 ] 
	then echo "need to specify port number" 
	exit
fi

serialport=/dev/ttyUSB$1

stty -F $serialport 57600 raw -echo   #setup serial port to 115200 on ttyUSB0 (Default)
exec 3<$serialport 
	cd /tmp/
	rm -f ttyDump.dat                    
	cat <&3 > /tmp/ttyDump.dat & #start serial log
	PID=$!
		echo ""
		echo "unlogall true" > $serialport
		echo "removed old logging parameters, check log for startup status"
		sleep 1.0s
		echo ""
		echo "log loglist" > $serialport
		echo "checking for currently logged variables. should only be one variable."
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "ready to do gps things, yo!"
echo ""
