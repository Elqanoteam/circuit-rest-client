module CircuitApi
  module Resources
    class Message < Base
      def api_resource
        'conversations/:id/messages'
      end

      def create(conversation_id, params)
        result = connection(
          api_resource.sub(':id', conversation_id),
          params
        ).post
        response_to_object(result)
      end
    end
  end
end
