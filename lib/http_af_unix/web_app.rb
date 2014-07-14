require 'http_af_unix'
require 'sinatra'

class HTTPAFUnix::WebApp < Sinatra::Base
  get '/' do
    "Hello, nginx and unicorn!\n"
  end
end
