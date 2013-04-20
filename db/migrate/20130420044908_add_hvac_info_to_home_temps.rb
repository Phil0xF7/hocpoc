class AddHvacInfoToHomeTemps < ActiveRecord::Migration
  def change
    add_column :home_temps, :hvac_heater_state, :boolean
    add_column :home_temps, :hvac_fan_state, :boolean
  end
end
