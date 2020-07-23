require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  error Mongoid::Errors::DocumentNotFound do
    halt 404
  end

  get "/" do
    erb :index
  end
end