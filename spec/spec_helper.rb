ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  DatabaseCleaner[:mongoid].strategy = :deletion

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end