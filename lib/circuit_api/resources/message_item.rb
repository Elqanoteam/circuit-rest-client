module CircuitApi
  module Resources
    class MessageItem < Base
      def api_resource
        'conversations/:conversation_id/messages/:id'
      end

      def find(id)
        path = api_resource
          .sub(':conversation_id/', '')
          .sub(':id', id)

        result = connection(path).get
        response_to_object(result)
      end

      def all(conversation_id, params = {})
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub('messages/:id', 'items')

        result = connection(path, params).get
        response_to_object(result)
      end

      def update(conversation_id, id, params)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection(path, params).put
        response_to_object(result)
      end

      def delete(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection(path).delete
        response_to_object(result)
      end

      def pin(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub('messages', 'pins')
          .sub(':id', id)

        result = connection(path).post
        response_to_object(result)
      end

      def unpin(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub('messages', 'pins')
          .sub(':id', id)

        result = connection(path).delete
        response_to_object(result)
      end

      def flag(conversation_id, id, params)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection("#{path}/flag", params).post
        response_to_object(result)
      end

      def unflag(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection("#{path}/flag").delete
        response_to_object(result)
      end

      def like(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection("#{path}/like").post
        response_to_object(result)
      end

      def unlike(conversation_id, id)
        path = api_resource
          .sub(':conversation_id', conversation_id)
          .sub(':id', id)

        result = connection("#{path}/like").delete
        response_to_object(result)
      end
    end
  end
end
