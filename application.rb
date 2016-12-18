require 'sinatra'
require 'json'

Dir.glob('lib/**/*.rb').each { |file| require_relative file }

def freckle_service
  Freckle::Service.new
end

get '/timers' do
  freckle_service.timers
end

post '/events' do
  payload = JSON.parse(request.body.read)
  freckle_service.process(payload)
end
