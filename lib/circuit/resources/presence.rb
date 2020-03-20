module Circuit
  module Resources
    class Presence < Base
      class << self
        def api_resource
          'users'
        end

        def update
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/presence",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).put
          response_to_object(result)
        end

        def all(params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/presence",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end

        def find(id)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/#{id}/presence",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end
      end
    end
  end
end
