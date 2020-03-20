module CircuitApi
  module Resources
    class Conversation < Base
      def api_resource
        'conversations'
      end

      def create_direct(participant)
        result = connection("#{api_resource}/direct", participant: participant).post
        response_to_object(result)
      end
    end
  end
end
