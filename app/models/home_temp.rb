class HomeTemp < ActiveRecord::Base
  attr_accessible :humidity, :temp

  def self.retrieve_data
    logger.info "#{Time.now} - HomeTemp.retrieve_data - Start"
    logger.info "#{Time.now} - HomeTemp.retrieve_data - Write to DB"

    HomeTemp.create(:humidity => rand(100), :temp => rand(100))

    logger.info "#{Time.now} - HomeTemp.retrieve_data - End"
  end
end
