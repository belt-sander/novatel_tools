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
		echo "unlogall true" > $serialport
		echo "unlogall true"
		sleep 0.5s

		echo "LOG FILE RXSTATUSB ONCE" > $serialport
		echo "log rxstatusb once"
		sleep 0.5s

		echo "LOG FILE THISANTENNATYPEB ONCE" > $serialport
		echo "log file thisantennatypeb once"
		sleep 0.5s

		echo "LOG FILE HEADINGB ONNEW" > $serialport
		echo "log file headingb onnew"
		sleep 0.5

		echo "LOG FILE HEADING2B ONNEW" > $serialport
		echo "log file heading2b onnew"
		sleep 0.5s

		echo "LOG FILE RAWIMUSXB ONNEW" > $serialport
		echo "log file rawimusxb onnew"
		sleep 0.5s
		
		echo "LOG FILE VEHICLEBODYROTATIONB ONCHANGED" > $serialport
		echo "log flie vehiclebodyrotationb onchanged"
		sleep 0.5s

		echo "LOG FILE SETIMUORIENTATIONB ONCHANGED" > $serialport
		echo "log file setimuorientationb onchanged"
		sleep 0.5s

		echo "LOG FILE IMUTOANTOFFSETSB ONCHANGED" > $serialport
		echo "log file imutoantoffsetsb onchanged"
		sleep 0.5s

		echo "LOG FILE RAWEPHEMB ONCHANGED" > $serialport
		echo "log file rawephemb onchanged"
		sleep 0.5s

		echo "LOG FILE GLOEPHEMERISB ONCHANGED" > $serialport
		echo "log file gloephemerisb onchanged"
		sleep 0.5s

		echo "LOG FILE TIMEB ONTIME 1" > $serialport
		echo "log file timeb ontime 1"
		sleep 0.5s

		echo "LOG FILE BESTPOSB ONTIME 1" > $serialport
		echo "log file bestposb ontime 1"
		sleep 0.5s

		echo "LOG FILE BESTGNSSPOSB ONTIME 1" > $serialport
		echo "log file bestgnssposb ontime 1"
		sleep 0.5s

		echo "LOG FILE MARKTIMEB ONNEW" > $serialport
		echo "log file marktimeb onnew"
		sleep 0.5s

		echo "LOG FILE INSPVAXB ONTIME 1" > $serialport
		echo "log file inspvaxb ontime 1"
		sleep 0.5s

		echo "LOG FILE RANGEB ONTIME 1" > $serialport
		echo "log file rangeb ontime 1"
		sleep 0.5s

		echo "LOG FILE INSUPDATEB ONCHANGED" > $serialport
		echo "log file insupdateb onchanged"
		sleep 0.5s

		echo "LOG FILE GLORAWEPHEMB ONCHANGED" > $serialport
		echo "log file glorawephemb onchanged"
		sleep 0.5s

		echo "logfile open" > $serialport
		echo "logging started (check for blinking green light on ProPak6!!)"
		sleep 5.0s

		echo "log loglist" > $serialport
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "logging setup complete, yo!"
echo ""
