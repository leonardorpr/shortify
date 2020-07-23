require './config/environment'
require 'rack'
require 'rack/contrib'

use Rack::JSONBodyParser
use UrlShortenerController

run ApplicationController