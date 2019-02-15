#!/bin/bash

stty -F /dev/ttyUSB0 115200 raw -echo   #setup serial port to 115200 on ttyUSB0 (Default)
exec 3</dev/ttyUSB0 
	cd /tmp/
	rm ttyDump.dat                    
	cat <&3 > /tmp/ttyDump.dat & #start serial log
	PID=$!
		echo "unlogall true" > /dev/ttyUSB0
		echo "unlogall true"
		sleep 0.5s

		echo "LOG FILE RXSTATUSB ONCE" > /dev/ttyUSB0
		echo "log rxstatusb once"
		sleep 0.5s

		echo "LOG FILE THISANTENNATYPEB ONCE" > /dev/ttyUSB0
		echo "log file thisantennatypeb once"
		sleep 0.5s

		echo "LOG FILE HEADINGB ONNEW" > /dev/ttyUSB0
		echo "log file headingb onnew"
		sleep 0.5

		echo "LOG FILE HEADING2B ONNEW" > /dev/ttyUSB0
		echo "log file heading2b onnew"
		sleep 0.5s

		echo "LOG FILE RAWIMUSXB ONNEW" > /dev/ttyUSB0
		echo "log file rawimusxb onnew"
		sleep 0.5s
		
		echo "LOG FILE VEHICLEBODYROTATIONB ONCHANGED" > /dev/ttyUSB0
		echo "log flie vehiclebodyrotationb onchanged"
		sleep 0.5s

		echo "LOG FILE SETIMUORIENTATIONB ONCHANGED" > /dev/ttyUSB0
		echo "log file setimuorientationb onchanged"
		sleep 0.5s

		echo "LOG FILE IMUTOANTOFFSETSB ONCHANGED" > /dev/ttyUSB0
		echo "log file imutoantoffsetsb onchanged"
		sleep 0.5s

		echo "LOG FILE RAWEPHEMB ONCHANGED" > /dev/ttyUSB0
		echo "log file rawephemb onchanged"
		sleep 0.5s

		echo "LOG FILE GLOEPHEMERISB ONCHANGED" > /dev/ttyUSB0
		echo "log file gloephemerisb onchanged"
		sleep 0.5s

		echo "LOG FILE TIMEB ONTIME 1" > /dev/ttyUSB0
		echo "log file timeb ontime 1"
		sleep 0.5s

		echo "LOG FILE BESTPOSB ONTIME 1" > /dev/ttyUSB0
		echo "log file bestposb ontime 1"
		sleep 0.5s

		echo "LOG FILE BESTGNSSPOSB ONTIME 1" > /dev/ttyUSB0
		echo "log file bestgnssposb ontime 1"
		sleep 0.5s

		echo "LOG FILE MARKTIMEB ONNEW" > /dev/ttyUSB0
		echo "log file marktimeb onnew"
		sleep 0.5s

		echo "LOG FILE INSPVAXB ONTIME 1" > /dev/ttyUSB0
		echo "log file inspvaxb ontime 1"
		sleep 0.5s

		echo "LOG FILE RANGEB ONTIME 1" > /dev/ttyUSB0
		echo "log file rangeb ontime 1"
		sleep 0.5s

		echo "LOG FILE INSUPDATEB ONCHANGED" > /dev/ttyUSB0
		echo "log file insupdateb onchanged"
		sleep 0.5s

		echo "LOG FILE GLORAWEPHEMB ONCHANGED" > /dev/ttyUSB0
		echo "log file glorawephemb onchanged"
		sleep 0.5s

		echo "logfile open" > /dev/ttyUSB0
		echo "logging started (check for blinking green light on ProPak6!!)"
		sleep 5.0s

		echo "log loglist" > /dev/ttyUSB0
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "logging setup complete, yo!"
echo ""