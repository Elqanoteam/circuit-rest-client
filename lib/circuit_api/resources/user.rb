module CircuitApi
  module Resources
    class User < Base
      def api_resource
        'users'
      end

      def profile
        result = connection("#{api_resource}/profile").get
        response_to_object(result)
      end

      def update_profile(params)
        result = connection("#{api_resource}/profile", params).put
        response_to_object(result)
      end

      def find_by_email(email, params = {})
        result = connection("#{api_resource}/#{email}/getUserByEmail", params).get
        response_to_object(result)
      end

      def search(params)
        result = connection("#{api_resource}/list", params).get
        response_to_object(result)
      end
    end
  end
end
