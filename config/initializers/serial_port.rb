#this is the default location for the serial port on mac osx might be different per machine
def mounted_serial_port
  Dir["/dev/tty.usbmodem*"].first
end
port_str = mounted_serial_port 
if port_str.present? 
  baud_rate = 9600
  data_bits = 8
  stop_bits = 1
  parity = SerialPort::NONE
  SERIAL_PORT = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
end