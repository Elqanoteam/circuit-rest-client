module CircuitApi
  module Utils
    class Connection
      RESPONSE_SUCCESS_CODES = [200, 201, 202, 204].freeze

      attr_reader :client, :action_url, :body

      def initialize(client, action_url, body = nil)
        @client = client
        @action_url = action_url
        @body = body
      end

      def get
        perform_query(:get)
      end

      def post
        perform_query(:post)
      end

      def put
        perform_query(:put)
      end

      def delete
        perform_query(:delete)
      end

      private

      def http_client
        @http_client ||= Net::HTTP.new(uri.hostname, uri.port)
          .tap { |h| h.use_ssl = true }
      end

      def uri
        @uri ||= URI.join(client.api_url, action_url)
      end

      def headers
        {
          'Authorization' => "Bearer #{client.token}",
          'Content-Type' => 'application/json; charset=utf-8'
        }
      end

      def perform_query(verb)
        response = http_client.send_request(
          verb.to_s.upcase,
          uri.path,
          CircuitApi::Utils::Object.blank?(body) ? '' : body.to_json,
          headers
        )

        raise_error(response) unless RESPONSE_SUCCESS_CODES.include?(response.code.to_i)

        CircuitApi::Utils::Object.blank?(response.body) ? {} : JSON.parse(response.body)
      end

      def raise_error(response)
        error_class = case response.code.to_i
        when 400
          CircuitApi::BadRequest
        when 401
          CircuitApi::Unauthorized
        when 500
          CircuitApi::InternalServerError
        when 503
          CircuitApi::ServiceUnavailable
        else
          CircuitApi::HttpError
        end

        raise error_class.new(response.code, response.body, uri)
      end
    end
  end
end
