module Circuit
  module Resources
    class Conversation < Base
      class << self
        def api_resource
          'conversations'
        end

        def all_by_ids(params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/byIds",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end
      end
    end
  end
end
