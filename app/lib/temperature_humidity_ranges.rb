class TemperatureHumidityRanges
  def initialize(min_temperature, max_temperature, min_humidity, max_humidity)
    @min_temperature = min_temperature
    @max_temperature = max_temperature
    @min_humidity = min_humidity
    @max_humidity = max_humidity
  end

  def temperature_range
    @min_temperature..@max_temperature
  end

  def humidity_range
    @min_humidity..@max_humidity
  end
end