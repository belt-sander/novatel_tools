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
		echo "LOG FILE VERSIONB ONCE" > $serialport
		echo "logging versionb once"
		sleep 1.0s
		echo ""
		echo "LOG FILE RXSTATUSB ONCE" > $serialport
		echo "logging rxstatusb once"
		sleep 1.0s
		echo ""
		echo "LOG FILE RXCONFIGB ONCE" > $serialport		
		echo "logging rxconfigb once"
		sleep 1.0s
		echo ""
		echo "LOG FILE RAWEPHEMB ONCHANGED" > $serialport
		echo "logging rawephemb onchanged"
		sleep 1.0s
		echo ""
		echo "LOG FILE GLOEPHEMERISB ONCHANGED" > $serialport
		echo "logging gloephemerisb onchanged"
		sleep 1.0s
        echo ""
		echo "LOG FILE ALMANACB ONNEW" > $serialport
		echo "logging almanacb onchanged"		
        sleep 1.0s
        echo ""
		echo "LOG FILE GLOALMANACB ONNEW" > $serialport
		echo "logging gloalmanacb onchanged"		
        sleep 1.0s
		echo ""
		echo "LOG FILE GLOCLOCKB ONCHANGED" > $serialport
		echo "logging gloclockb onchanged"		
        sleep 1.0s
		echo ""
		echo "LOG FILE RANGECMP2B ONTIME 1" > $serialport
		echo "logging rangecmp2b ontime 1"		
        sleep 1.0s
		echo ""
		echo "LOG FILE BESTPOSB ONTIME 10" > $serialport
		echo "logging bestposb ontime 10"		
        sleep 1.0s			
        echo ""
		echo "saveconfig" > $serialport
		echo "good ole saveconfig"
        sleep 1.0s		
        echo "fileconfig open" > $serialport
		echo "file logging started."
		sleep 1.0s
	 kill $PID	
exec 3<&-
cat /tmp/ttyDump.dat #show dumped serial output

echo ""
echo "rtk base data is logging for post processing!"
echo ""
