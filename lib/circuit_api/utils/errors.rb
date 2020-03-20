module CircuitApi
  class HttpError < StandardError
    attr_reader :error_code, :error_body

    def initialize(code, body)
      @error_code = code
      @error_body = body
    end

    def message
      "HTTP #{error_code}. Error: #{error_body}"
    end
  end

  class BadRequest < HttpError; end;
  class Unauthorized < HttpError; end;
  class InternalServerError < HttpError; end;
  class ServiceUnavailable < HttpError; end;
end
