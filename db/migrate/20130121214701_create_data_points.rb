class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.float :temperature_in_celcius, :null => false
      t.float :humidity, :null => false
      t.timestamps
    end
  end
end
