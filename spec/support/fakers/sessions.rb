class CircuitFaker < Sinatra::Base
  get '/rest/v2/rtc/sessions' do
    json_response(200, 'sessions/sessions')
  end
end
