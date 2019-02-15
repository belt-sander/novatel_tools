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
		echo ""
		echo "you are about to delete all of the internally stored data!!111one1!! in 15 seconds!!one11!!"
		sleep 15.0s

		echo ""
		echo "doscmd del * " > $serialport
		echo "deleted all internally stored data!!"
		sleep 5.0s

		echo ""
		echo "log logfilestatus" > $serialport
		echo "log status check"
		sleep 1.0s

		echo ""
		echo "unlogall true" > $serialport
		echo "removed old logging parameters"
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "data deleted, yo!"
echo ""
