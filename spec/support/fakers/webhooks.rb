class CircuitFaker < Sinatra::Base
  get '/rest/v2/webhooks' do
    json_response(200, 'webhooks/webhooks')
  end

  get '/rest/v2/webhooks/:id' do
    json_response(200, 'webhooks/webhook')
  end

  post '/rest/v2/webhooks' do
    json_response(200, 'webhooks/webhook')
  end

  delete '/rest/v2/webhooks/:id' do
    blank_response(200)
  end

  delete '/rest/v2/webhooks' do
    blank_response(200)
  end

  put '/rest/v2/webhooks/:id' do
    json_response(200, 'webhooks/webhook')
  end

  post '/rest/v2/webhooks/presence' do
    json_response(200, 'webhooks/webhook')
  end

  put '/rest/v2/webhooks/presence/:id' do
    json_response(200, 'webhooks/webhook')
  end
end
