require './config/environment'

class ApplicationController < Sinatra::Base
  before do
    request.body.rewind
    @request_payload = JSON.parse request.body.read, symbolize_names: true
  end
end