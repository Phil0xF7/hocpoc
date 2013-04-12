# Load the rails application
require File.expand_path('../application', __FILE__)

# Log Configuration
require 'logger'
logger = Logger.new("#{Rails.root}/log/#{Rails.env}.log")
logger.formatter = Logger::Formatter.new

# Initialize the rails application
Hocpoc::Application.initialize!
