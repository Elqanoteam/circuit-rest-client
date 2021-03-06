class CircuitFaker < Sinatra::Base
  get '/rest/v2/users' do
    json_response(200, 'users/users')
  end

  get '/rest/v2/users/list' do
    json_response(200, 'users/users')
  end

  get '/rest/v2/users/profile' do
    json_response(200, 'users/user')
  end

  get '/rest/v2/users/:email/getUserByEmail' do
    json_response(200, 'users/user')
  end

  put '/rest/v2/users/profile' do
    json_response(200, 'users/user')
  end

  get '/rest/v2/users/presence' do
    json_response(200, 'presence/presences')
  end

  get '/rest/v2/users/:id' do
    json_response(200, 'users/user')
  end

  get '/rest/v2/users/:user_id/presence' do
    json_response(200, 'presence/presence')
  end

  put '/rest/v2/users/presence' do
    json_response(200, 'presence/presence')
  end
end
