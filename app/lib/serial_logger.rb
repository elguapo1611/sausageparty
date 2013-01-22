class SerialLogger
  def initialize
    port_str = mounted_serial_port  #may be different for you  
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    @data_str = ""
    @serial_port = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)  
  end

  def run_log
    while true do
      sp_char = @serial_port.getc

      log(sp_char) if sp_char
    end
  end




private

  def log(data)
    @data_str += data
    store_and_clear_data_str if data.include?("\n")
  end

  # data is read from serial in the following format:
  # temp|humidity
  def store_and_clear_data_str
    data = @data_str.strip.split("|")
    begin
      d = DataPoint.create(:temperature_in_celcius => data[0], :humidity => data[1])
    end
    puts d.inspect
    clear_data_str
  end

  def clear_data_str
    @data_str = ""
  end

  #this is the default location for the serial port on mac osx might be different per machine
  def mounted_serial_port
    Dir["/dev/tty.usbmodem*"].first
  end
end

