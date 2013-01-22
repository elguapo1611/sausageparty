class DataPoint < ActiveRecord::Base
  attr_accessible :humidity, :temperature_in_celcius
  validates_presence_of :humidity, :temperature_in_celcius
  # attr_accessible :title, :body
end
