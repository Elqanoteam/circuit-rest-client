module Circuit
  module Resources
    class Message < Base
      class << self
        def api_resource
          'conversations/:id/message'
        end

        def create(conversation_id, params)
          result = Circuit::Utils::Connection.new(
            api_resource.sub(':id', conversation_id),
            Circuit::Utils::Attributes.camelize_keys(params)
          ).post
          response_to_object(result)
        end
      end
    end
  end
end
