module Circuit
  module Resources
    class Session < Base
      class << self
        def api_resource
          'rtc/sessions'
        end

        def all
          result = Circuit::Utils::Connection.new(
            api_resource,
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end
      end
    end
  end
end
