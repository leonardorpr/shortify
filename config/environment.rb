ENV['SINATRA_ENV'] ||= "development"

require 'mongoid'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Mongoid.load!(File.join(File.dirname(__FILE__), 'mongoid.yml'))

require 'dotenv/load'
require './app/controllers/application_controller'
require_all 'app'