module CircuitApi
  module Resources
    class Presence < Base
      def api_resource
        'users'
      end

      def update(params)
        result = connection("#{api_resource}/presence", params).put
        response_to_object(result)
      end

      def all(params)
        result = connection("#{api_resource}/presence", params).get
        response_to_object(result)
      end

      def find(user_id)
        result = connection("#{api_resource}/#{user_id}/presence").get
        response_to_object(result)
      end
    end
  end
end
