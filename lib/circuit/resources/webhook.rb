module Circuit
  module Resources
    class Webhook < Base
      class << self
        def api_resource
          'webhooks'
        end

        def create_presence(params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/presence",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).post
          response_to_object(result)
        end

        def update_presence(id, params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/presence/#{id}",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).put
          response_to_object(result)
        end
      end
    end
  end
end
