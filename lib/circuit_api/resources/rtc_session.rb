module CircuitApi
  module Resources
    class RtcSession < Base
      def api_resource
        'rtc/sessions'
      end

      def all
        result = connection(api_resource).get
        response_to_object(result)
      end
    end
  end
end
