module Circuit
  module Utils
    class Connection
      RESPONSE_SUCCESS_CODES = [200, 201, 202, 204].freeze

      attr_reader :action_url, :body

      def initialize(action_url, body = nil)
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

      def client
        @client ||= Net::HTTP.new(uri.hostname, uri.port)
          .tap { |h| h.use_ssl = true }
      end

      def uri
        @uri ||= URI.join(Circuit.api_url, action_url)
      end

      def headers
        {
          'Authorization' => "Bearer #{Circuit.bearer_token}",
          'Content-Type' => 'application/json; charset=utf-8'
        }
      end

      def perform_query(verb)
        response = client.send_request(
          verb.to_s.upcase,
          uri.path,
          Circuit::Utils::Object.blank?(body) ? '' : body.to_json,
          headers
        )

        raise_error(response) unless RESPONSE_SUCCESS_CODES.include?(response.code.to_i)

        Circuit::Utils::Object.blank?(response.body) ? {} : JSON.parse(response.body)
      end

      def raise_error(response)
        error_class = case response.code.to_i
        when 400
          Circuit::BadRequest
        when 401
          Circuit::Unauthorized
        when 500
          Circuit::InternalServerError
        when 503
          Circuit::ServiceUnavailable
        else
          Circuit::HttpError
        end

        raise error_class.new(response.code, response.body)
      end
    end
  end
end