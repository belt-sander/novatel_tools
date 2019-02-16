This is a simple way to initalize logging via serial on a Novatel PP6 GPS receiver.

This assumes that you are using a USB->Serial cable that will appear as `/dev/ttyUSB0`
in a unix environment. If you are using a USB->Serial cable that does not exist at `/dev/ttyUSB0`
e.g. `/dev/ttyUSB1` etc... you will need to pass the argument to the bash script:

for a device located at `/dev/ttyUSB0`

`~$ sudo ./internal_log_start_novatel.sh 0` 

for a device located at `/dev/ttyUSB1`

`~$ sudo ./internal_log_start_novatel.sh 1`


Usually, in linux, the USB-Micro port on the PP6 reciever comes in to the laptop as
`/dev/ttyUSB0` but be sure to check on your machine. 

*when the device is first started up, you must send:*

`~$ sudo ./novatel_start` and make sure that you get an <OK> response when the 
script is finished.

*to log the specified post processed values needed for PPK internally on the PP6*

`~$ sudo ./internal_log_start_novatel.sh 0` and make sure that the green LED next to the 
disk icon is *flashing green* at 1hz.

*to stop the internal log on the PP6*

`~$ sudo ./internal_log_stop_novatel.sh 0` and make sure that the green LED next to the 
disk icon is *not flashing green*.



Note:

This also assumes that you have configured the Novatel receiver using the `SERIALCONFIG`
command to set up the basic serial configuration.

Example:

`SERIALCONFIG <yourSerialPort> 115200 N 8 1 N ON`

Note: the `./internal_log_delete_novatel.sh` script is currently broken. Unsure of cause. 
