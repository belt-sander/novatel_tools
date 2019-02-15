This is a simple way to initalize logging via serial on a Novatel PP6 GPS receiver.

This assumes that you are using a USB->Serial cable that will appear as `/dev/ttyUSB0`
in a unix environment. If you are using a USB->Serial cable that does not exist at `/dev/ttyUSB0`
e.g. `/dev/ttyUSB1` etc... you will need to pass the argument to the bash script:

for a device located at `/dev/ttyUSB0`

`sudo ./internal_log_start_novatel.sh 0` 

for a device located at `/dev/ttyUSB1`

`sudo ./internal_log_start_novatel.sh 1`


This also assumes that you have configured the Novatel receiver using the `SERIALCONFIG`
command to set up the basic serial configuration.

Example:

`SERIALCONFIG <yourSerialPort> 115200 N 8 1 N ON`
