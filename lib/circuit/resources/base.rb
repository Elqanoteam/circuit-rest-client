module Circuit
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def api_resource
        raise NotImplementedError
      end

      def find(id)
        result = connection("#{api_resource}/#{id}").get
        response_to_object(result)
      end

      def all(params = {})
        result = connection(api_resource, params).get
        response_to_object(result)
      end

      def create(params)
        result = connection(api_resource, params).post
        response_to_object(result)
      end

      def update(id, params)
        result = connection("#{api_resource}/#{id}", params ).put
        response_to_object(result)
      end

      def delete(id, params = {})
        result = connection("#{api_resource}/#{id}", params).delete
        response_to_object(result)
      end

      def delete_all(params = {})
        result = connection(api_resource, params).delete
        response_to_object(result)
      end

      protected

      def connection(resource_path, params = {})
        Circuit::Utils::Connection.new(
          client,
          resource_path,
          Circuit::Utils::Attributes.camelize_keys(params)
        )
      end

      def response_to_object(response)
        case response
        when Hash
          return nil if Circuit::Utils::Object.blank?(response)
          to_object(response)
        when Array
          response.map do |item|
            to_object(item)
          end
        end
      end

      def to_object(values)
        attributes = Circuit::Utils::Attributes.snake_keys(values)
        #binding.pry
        Circuit::Resource.new('foo', attributes)
      end
    end
  end
end
