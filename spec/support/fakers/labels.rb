class CircuitFaker < Sinatra::Base
  get '/rest/v2/users/labels' do
    json_response(200, 'labels/labels')
  end

  delete '/rest/v2/users/labels/:id' do
    json_response(200, 'labels/label')
  end

  post '/rest/v2/users/labels' do
    json_response(200, 'labels/label')
  end
end
