# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
HomeTemp.create(temp: 65.4, humidity: 45.1, hvac_heater_state: false, hvac_fan_state: false)
HomeTemp.create(temp: 67.8, humidity: 40.4, hvac_heater_state: false, hvac_fan_state: false)
HomeTemp.create(temp: 62.1, humidity: 42.6, hvac_heater_state: false, hvac_fan_state: false)
HomeTemp.create(temp: 61.3, humidity: 44.7, hvac_heater_state: true, hvac_fan_state: true)
HomeTemp.create(temp: 55.2, humidity: 46.2, hvac_heater_state: true, hvac_fan_state: true)
HomeTemp.create(temp: 58.3, humidity: 47.1, hvac_heater_state: true, hvac_fan_state: true)
HomeTemp.create(temp: 61.7, humidity: 42.6, hvac_heater_state: true, hvac_fan_state: true)
HomeTemp.create(temp: 66.1, humidity: 44.4, hvac_heater_state: false, hvac_fan_state: false)
HomeTemp.create(temp: 68.2, humidity: 43.9, hvac_heater_state: false, hvac_fan_state: false)
HomeTemp.create(temp: 65.5, humidity: 42.8, hvac_heater_state: false, hvac_fan_state: false)
num = 0
HomeTemp.all.each do |entry|
  entry.created_at += num.minutes
  entry.save
  num += 5
end