module CircuitApi
  # Network Errors
  class HttpError < StandardError
    attr_reader :error_code, :error_body, :uri

    def initialize(code, body, uri)
      @error_code = code
      @error_body = body
      @uri = uri
    end

    def message
      "HTTP #{error_code} - URI: #{uri}.\n Error: #{error_body}"
    end

    def json_message
      JSON.parse(error_body)
    end
  end

  class BadRequest < HttpError; end;
  class Unauthorized < HttpError; end;
  class InternalServerError < HttpError; end;
  class ServiceUnavailable < HttpError; end;

  # Data errors
  class ValidationError < StandardError
    attr_reader :errors, :uri

    def initialize(errors, uri)
      @errors = errors
      @uri = uri
    end

    def message
      "URI: #{uri}.\n Errors: #{errors}"
    end
  end
end
