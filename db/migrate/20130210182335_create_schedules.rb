class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :start_at, :null => false
      t.datetime :end_at
      t.float :min_temperature_in_celcius, :null => false
      t.float :max_temperature_in_celcius, :null => false
      t.float :min_humidity, :null => false
      t.float :max_humidity, :null => false
      t.timestamps
    end
  end
end
