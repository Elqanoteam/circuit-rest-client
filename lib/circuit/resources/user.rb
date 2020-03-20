module Circuit
  module Resources
    class User < Base
      class << self
        def api_resource
          'users'
        end

        def profile
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/profile",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end

        def update_profile(params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/profile",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).put
          response_to_object(result)
        end

        def find_by_email(email)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/#{email}/getUserByEmail",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end

        def search(params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/list",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end
      end
    end
  end
end
