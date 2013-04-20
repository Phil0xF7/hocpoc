class HomeTemp < ActiveRecord::Base
  attr_accessible :humidity, :temp, :hvac_heater_state, :hvac_fan_state

  def self.retrieve_data
    logger.info "#{Time.now} - HomeTemp.retrieve_data - Start"

    @nest = NestThermostat::Nest.new({email: ENV['NEST_EMAIL'], password: ENV['NEST_PASS']})

    if @nest
      logger.info "#{Time.now} - HomeTemp.retrieve_data - Write to DB"
      HomeTemp.create(
        :temp => @nest.current_temp,
        :humidity => @nest.humidity,
        :hvac_heater_state => @nest.status["shared"][@nest.device_id]["hvac_heater_state"],
        :hvac_fan_state => @nest.status["shared"][@nest.device_id]["hvac_fan_state"]
      )
    else
      logger.error "#{Time.now} - HomeTemp.retrieve_data - Error establishing connection"
    end

    logger.info "#{Time.now} - HomeTemp.retrieve_data - End"
  end
end
