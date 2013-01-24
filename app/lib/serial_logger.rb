class SerialLogger
  def initialize(serial_port)
    @data_str = ""
    @serial_port = serial_port
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
    d = DataPoint.create(:temperature_in_celcius => data[0], :humidity => data[1])
    clear_data_str
  end

  def clear_data_str
    @data_str = ""
  end

end

