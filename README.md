This is a simple way to initalize logging via serial on a Novatel PP6 GPS receiver.

This assumes that you are using a USB->Serial cable that will appear as `/dev/ttyUSB0`
in a unix environment. 

This also assumes that you have configured the Novatel receiver using the `SERIALCONFIG`
command to set up the basic serial configuration.

`SERIALCONFIG <yourSerialPort> 115200 N 8 1 N ON`
