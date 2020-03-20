class CircuitFaker < Sinatra::Base
  post '/rest/v2/conversations/direct' do
    json_response(200, 'conversations/conversation')
  end

  post '/rest/v2/conversations/:id/message' do
    json_response(200, 'messages/message')
  end
end
