module CircuitApi
  module Resources
    class Conversation < Base
      DIRECT = 'DIRECT'.freeze
      GROUP = 'GROUP'.freeze
      COMMUNITY = 'COMMUNITY'.freeze
      LARGE = 'LARGE'.freeze

      def api_resource
        'conversations'
      end

      def create_direct(participant)
        result = nil

        begin
          result = connection("#{api_resource}/direct", participant: participant).post
        rescue CircuitApi::HttpError => e
          raise unless e.error_code.to_i == 409

          result = JSON.parse(e.error_body)
        end

        response_to_object(result)
      rescue CircuitApi::BadRequest => e
        handle_validation_errors(e)
      end
    end
  end
end
