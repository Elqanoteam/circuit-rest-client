module Circuit
  module Resources
    class Webhook < Base
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
