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
		echo "serialconfig com2 57600 n 8 1 n on" > $serialport
		echo "setup serial port com2 at 57600 baud with an 8N1 message"
		sleep 1.0s
		echo ""
		echo "interfacemode com2 none rtcmv3 off" > $serialport
		echo "setup serial port com2 to publish rtcmv3 corrections"
		sleep 1.0s
		echo ""
		echo "LOG COM2 RTCM1004 ONTIME 1" > $serialport
		echo "publishing rtcm1004"
		sleep 1.0s
		echo ""
		echo "LOG COM2 RTCM1012 ONTIME 1" > $serialport
		echo "publishing rtcm1012"
		sleep 1.0s
		echo ""
		echo "LOG COM2 RTCM1006 ONTIME 10" > $serialport
		echo "publishing rtcm1006"
		sleep 1.0s
		echo ""
		echo "LOG COM2 RTCM1033 ONTIME 10" > $serialport
		echo "publishing rtcm1033"
		sleep 1.0s
		echo ""
		echo "LOG COM2 RTCM1019 ONTIME 120" > $serialport
		echo "publishing rtcm1019"
		sleep 1.0s
		echo ""
		echo "autosurvey enable 10" > $serialport
		echo "autosurvey running for a total of 10 minutes"
		sleep 1.0s
		echo ""
		echo "saveconfig" > $serialport
		echo "good ole saveconfig"
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "rtk base station will be enabled in 10 minutes!"
echo ""
