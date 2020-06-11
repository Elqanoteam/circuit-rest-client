class CircuitFaker < Sinatra::Base
  post '/rest/v2/conversations/direct' do
    if JSON.parse(request.body.read)['participant'] == '00000000-3333-1111-2222-777777777777'
      json_response(409, 'conversations/existing_conversation')
    else
      json_response(200, 'conversations/conversation')
    end
  end

  post '/rest/v2/conversations/:id/messages' do
    json_response(200, 'messages/message')
  end

  post '/rest/v2/conversations/:id/messages/:item_id' do
    json_response(200, 'messages/item_message')
  end

  put '/rest/v2/conversations/:id/messages/:item_id' do
    json_response(200, 'messages/item_message')
  end

  get '/rest/v2/conversations/messages/:item_id' do
    json_response(200, 'messages/item_message')
  end

  get '/rest/v2/conversations/:id/items' do
    json_response(200, 'messages/item_messages')
  end

  delete '/rest/v2/conversations/:id/messages/:item_id' do
    json_response(200, 'messages/item_message')
  end

  post '/rest/v2/conversations/:id/pins/:item_id' do
    json_response(200, 'conversations/conversation')
  end

  delete '/rest/v2/conversations/:id/pins/:item_id' do
    json_response(200, 'conversations/conversation')
  end

  post '/rest/v2/conversations/:id/messages/:item_id/flag' do
    blank_response(200)
  end

  delete '/rest/v2/conversations/:id/messages/:item_id/flag' do
    blank_response(200)
  end

  post '/rest/v2/conversations/:id/messages/:item_id/like' do
    blank_response(200)
  end

  delete '/rest/v2/conversations/:id/messages/:item_id/like' do
    blank_response(200)
  end
end
