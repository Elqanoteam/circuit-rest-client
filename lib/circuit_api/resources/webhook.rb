module CircuitApi
  module Resources
    class Webhook < Base
      CONVERSATION_CREATE = 'CONVERSATION.CREATE'.freeze
      CONVERSATION_UPDATE = 'CONVERSATION.UPDATE'.freeze
      CONVERSATION_ADD_ITEM = 'CONVERSATION.ADD_ITEM'.freeze
      CONVERSATION_UPDATE_ITEM = 'CONVERSATION.UPDATE_ITEM'.freeze
      USER_SUBMIT_FORM = 'USER.SUBMIT_FORM_DATA'.freeze

      def api_resource
        'webhooks'
      end

      def create_presence(params)
        result = connection("#{api_resource}/presence", params).post
        response_to_object(result)
      end

      def update_presence(id, params)
        result = connection("#{api_resource}/presence/#{id}", params).put
        response_to_object(result)
      end
    end
  end
end
