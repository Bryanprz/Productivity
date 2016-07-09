# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

silence_warnings do
  require 'pry'
  IRB = Pry
end
