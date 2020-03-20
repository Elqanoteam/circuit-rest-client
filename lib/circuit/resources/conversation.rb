module Circuit
  module Resources
    class Conversation < Base
      class << self
        def api_resource
          'conversations'
        end

        def create_direct(participant)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/direct",
            Circuit::Utils::Attributes.camelize_keys(participant: participant)
          ).post
          response_to_object(result)
        end
      end
    end
  end
end
