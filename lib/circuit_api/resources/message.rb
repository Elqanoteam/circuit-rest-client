module CircuitApi
  module Resources
    class Message < Base
      def api_resource
        'conversations/:id/messages'
      end

      def create(conversation_id, params)
        path = api_resource.sub(':id', conversation_id)

        if CircuitApi::Utils::Object.present?(params[:item_id])
          path = "#{path}/#{params.delete(:item_id)}"
        end

        result = connection(path, params).post
        response_to_object(result)

      rescue CircuitApi::BadRequest => e
        handle_validation_errors(e)
      end
    end
  end
end
