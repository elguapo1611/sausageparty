class Schedule < ActiveRecord::Base

  attr_accessible :min_temperature_in_celcius,
                  :max_temperature_in_celcius,
                  :min_humidity,
                  :max_humidity,
                  :start_at,
                  :end_at

  validates_presence_of :min_temperature_in_celcius,
                        :max_temperature_in_celcius,
                        :min_humidity,
                        :max_humidity,
                        :start_at

  validates_numericality_of :min_temperature_in_celcius,
                            :max_temperature_in_celcius,
                            :min_humidity,
                            :max_humidity

  def temperature_range
    ranges.temperature_range
  end

  def humidity_range
    ranges.humidity_range
  end

  def self.current_schedule
    Schedule.where("start_at < ? AND ? <= end_at ", Time.now, Time.now).limit(1).try(:first)
  end

  private

  def ranges
    @ranges ||= TemperatureHumidityRanges.new(min_temperature_in_celcius, max_temperature_in_celcius, min_humidity, max_humidity)
  end

end
