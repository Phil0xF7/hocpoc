class HomeTemp < ActiveRecord::Base
  attr_accessible :humidity, :temp

  def self.retrieve_data
    logger.info "#{Time.now} - HomeTemp.retrieve_data - Start"

    @nest = NestThermostat::Nest.new({email: ENV['NEST_EMAIL'], password: ENV['NEST_PASS']})

    if @nest
      logger.info "#{Time.now} - HomeTemp.retrieve_data - Write to DB"
      HomeTemp.create(:temp => @nest.current_temp, :humidity => @nest.humidity)
    else
      logger.error "#{Time.now} - HomeTemp.retrieve_data - Error establishing connection"
    end

    logger.info "#{Time.now} - HomeTemp.retrieve_data - End"
  end
end
