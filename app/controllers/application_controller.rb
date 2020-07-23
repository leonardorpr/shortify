require './config/environment'

class ApplicationController < Sinatra::Base
  error Mongoid::Errors::DocumentNotFound do
    halt 404
  end
end