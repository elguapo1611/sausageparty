class DataPoint < ActiveRecord::Base
  attr_accessible :humidity, :temperature_in_celcius
  validates_presence_of :humidity, :temperature_in_celcius

  def temperature
    temperature_in_celcius
  end

  def temperature_formatted
    "#{temperature}&deg;C"
  end

  def timestamp
    created_at.to_time.to_i
  end
  # attr_accessible :title, :body
end
