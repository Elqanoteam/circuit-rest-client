module CircuitApi
  module Utils
    module Attributes
      def self.snake_keys(value)
        case value
        when Hash
          snake_hash_keys(value)
        when Array
          value.map { |v| snake_keys(v) }
        else
          value
        end
      end

      def self.snake_hash_keys(hash)
        Hash[hash.map { |k, v| [underscore_key(k).to_sym, snake_keys(v)] }]
      end

      def self.underscore_key(key)
        if key.is_a?(Symbol)
          underscore(key.to_s).to_sym
        elsif key.is_a?(String)
          underscore(key)
        else
          key
        end
      end

      def self.underscore(string)
        string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
          .gsub(/([a-z\d])([A-Z])/,'\1_\2')
          .tr("-", "_")
          .downcase
      end

      def self.camelize_keys(value)
        return value unless value.is_a?(Hash)
        value.keys.each do |k|
          new_key = camelize(k.to_s, false)
          new_key = new_key.to_sym if k.is_a? Symbol
          value[k].map { |current_array| self.camelize_keys(current_array) } if value[k].is_a?(Array)
          value[new_key] = value.delete(k)
        end
        value
      end

      def self.camelize(str, uppercase_first_letter = true)
        if uppercase_first_letter
          str = str.sub(/^[a-z\d]*/) { $&.capitalize }
        else
          str = str.sub(/^(?:(?=\b|[A-Z_])|\w)/) { $&.downcase }
        end
        str.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
      end
    end
  end
end
