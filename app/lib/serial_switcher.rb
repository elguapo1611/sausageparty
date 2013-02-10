class SerialSwitcher

  HUMIDITY_DATA_PORT = "7"
  FRIDGE_DATA_PORT = "6"
  ALL_OFF_DATA_STR = "/"

  STATUS_OFF = "off"
  STATUS_ON = "on"

  def initialize
    @fridge_status     = STATUS_OFF
    @humidifier_status = STATUS_OFF
  end

  def set_hardware_status
    schedule = Schedule.current_schedule
    turn_off_all
    set_target_temperature_in_celcius_range(schedule.temperature_range)
    set_target_humidity_range(schedule.humidity_range)
  end

  def status
    "fridge #{@fridge_status}, humidifier #{@humidifier_status}"
  end

  private

  def set_target_humidity_range(range)
    if !range.include?(current_humidity)
      turn_on_humidity
      @humidifier_status = STATUS_ON
    end
  end

  def set_target_temperature_in_celcius_range(range)
    if !range.include?(current_temperature)
      turn_on_fridge
      @fridge_status = STATUS_ON
    end
  end

  def turn_off_all
    @fridge_status = STATUS_OFF
    @humidifier_status = STATUS_OFF
    SERIAL_PORT.write(ALL_OFF_DATA_STR)
  end

  def turn_on_humidity
    SERIAL_PORT.write(HUMIDITY_DATA_PORT)
  end

  def turn_on_fridge
    SERIAL_PORT.write(FRIDGE_DATA_PORT)
  end

  def current_temperature
    current_data_point.temperature_in_celcius
  end

  def current_humidity
    current_data_point.humidity
  end

  def current_data_point
    @current_data_point ||= DataPoint.last
  end

end