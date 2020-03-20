module Circuit
  class Resource
    attr_reader :circuit_resource_type

    def initialize(circuit_resource_type, attributes)
      @circuit_resource_type = circuit_resource_type
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
