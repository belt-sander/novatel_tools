This is a simple way to initalize logging via serial on a Novatel PP6 and PP7 GPS receiver.

This assumes that you are using a USB->Serial cable that will appear as `/dev/ttyUSB0`
in a unix environment. If you are using a USB->Serial cable that does not exist at `/dev/ttyUSB0`
e.g. `/dev/ttyUSB1` etc... you will need to pass the argument to the bash script:

for a device located at `/dev/ttyUSB0`

`~$ sudo ./internal_log_start_novatel.sh 0` 

for a device located at `/dev/ttyUSB1`

`~$ sudo ./internal_log_start_novatel.sh 1`


Usually, in linux, the USB-Micro port on the PP6 or PP7 reciever comes in to the laptop as
`/dev/ttyUSB0` but be sure to check on your machine. 

*when the device is first started up, you must send:*

`~$ sudo ./novatel_start.sh 0` and make sure that you get an <OK> response when the 
script is finished.

*to log the specified post processed values needed for PPK internally on the PP6*

`~$ sudo ./internal_log_start_novatel.sh 0` and make sure that the green LED next to the 
disk icon is *flashing green* at 1hz.

*to stop the internal log on the PP6*

`~$ sudo ./internal_log_stop_novatel.sh 0` and make sure that the green LED next to the 
disk icon is *not flashing green*.

*to log the specified post processed values needed for PPK internally on the PP7*

`~$ sudo ./internal_log_start_novatel_pp7.sh 0` and make sure that the green LED next to the 
disk icon is *flashing green* at 1hz.

*to stop the internal log on the PP7*

`~$ sudo ./internal_log_stop_novatel_pp7.sh 0` and make sure that the green LED next to the 
disk icon is *not flashing green*.

*to start logging base station survey data on PP7*
`~$ sudo ./base_station_log.sh 0` and make sure that the green LED next to the disc icon is *flashing green* at 1hz.

this data can be used later to post process the antenna location for surveying the basestation accurately. 

*to start the `autosurvey` function. only use for relative accuracy tests*
`~$ sudo ./autosurvey.sh 0`

*to start publishing corrections from the master receiver, on com 1, at 57600 baud*
`~$ sudo ./base_station_enable.sh 0`

Note:

This also assumes that you have configured the Novatel receiver (rover) using the `SERIALCONFIG`
command to set up the basic serial configuration.

Example:

`SERIALCONFIG <yourSerialPort> 115200 N 8 1 N ON`