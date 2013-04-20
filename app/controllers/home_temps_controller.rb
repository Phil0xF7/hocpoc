class HomeTempsController < ApplicationController
  # GET /hometemps/data
  def data
    @temp = HomeTemp.select("created_at, temp, humidity")
    @temp.map! {|h| {:x => h.created_at.to_i, :y => h.temp.to_f}}
    @data = []
    @data << {:name => "Temp", :data => @temp}

    @humidity = HomeTemp.select("created_at, humidity")
    @humidity.map! {|h| {:x => h.created_at.to_i, :y => h.humidity.to_f}}
    @data << {:name => "Humidity", :data => @humidity}

    @hvac_heat = HomeTemp.select {"created_at, hvac_heater_state"}
    @hvac_heat.map! {|h|
      h.hvac_heater_state ? heater_val = 25 : heater_val = 0
      {:x => h.created_at.to_i, :y => heater_val}
    }
    @data << {:name => "Heater", :data => @hvac_heat}

    render json: @data
  end
  # GET /hometemps/temp
  def temp
    @temp = HomeTemp.select("created_at, temp")
    @temp.map! {|h| {:x => h.created_at.to_i, :y => h.temp.to_f}}
    @data = []
    @data << {:name => "Temp", :data => @temp}
    render json: @data
  end

  # GET /hometemps/humidity
  def humidity
    @humidity = HomeTemp.select("created_at, humidity")
    @humidity.map! {|h| {:x => h.created_at.to_i, :y => h.humidity.to_f}}
    @data = []
    @data << {:name => "Humidity", :data => @humidity}
    render json: @data
  end
end
