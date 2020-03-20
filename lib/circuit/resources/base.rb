module Circuit
  module Resources
    class Base
      def initialize(attributes)
        attributes.each do |name, value|
          define_accessors(name)
          send("#{name}=".to_sym, value)
        end
      end

      def to_json(options = {})
        instance_variables.each_with_object({}) do |variable, result|
          result[variable.to_s.delete('@')] = instance_variable_get(variable)
        end
      end

      class << self
        def api_resource
          raise NotImplementedError
        end

        def get(id)
          result = Circuit::Utils::Connection.new("#{api_resource}/#{id}").get
          response_to_object(result)
        end

        def all(params = {})
          result = Circuit::Utils::Connection.new(
            api_resource,
            Circuit::Utils::Attributes.camelize_keys(params)
          ).get
          response_to_object(result)
        end

        def create(params)
          result = Circuit::Utils::Connection.new(
            api_resource,
            Circuit::Utils::Attributes.camelize_keys(params)
          ).post
          response_to_object(result)
        end

        def update(id, params)
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/#{id}",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).put
          response_to_object(result)
        end

        def delete(id, params = {})
          result = Circuit::Utils::Connection.new(
            "#{api_resource}/#{id}",
            Circuit::Utils::Attributes.camelize_keys(params)
          ).delete
          response_to_object(result)
        end

        def delete_all(params = {})
          result = Circuit::Utils::Connection.new(
            api_resource,
            Circuit::Utils::Attributes.camelize_keys(params)
          ).delete
          response_to_object(result)
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
          new(attributes)
        end
      end

      private

      def define_accessors(name)
        define_getter(name)
        define_setter(name)
      end

      def define_setter(name)
        return if self.respond_to?("#{name}=".to_sym)

        self.class.send(:define_method, "#{name}=".to_sym) do |value|
          instance_variable_set("@#{name.to_s}", value)
        end
      end

      def define_getter(name)
        return if self.respond_to?(name.to_sym)

        self.class.send(:define_method, name.to_sym) do
          instance_variable_get("@#{name.to_s}")
        end
      end
    end
  end
end
