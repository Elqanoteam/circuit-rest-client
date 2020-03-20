module CircuitApi
  module Utils
    module Object
      def self.blank?(object)
        object.respond_to?(:empty?) ? !!object.empty? : !object
      end

      def self.present?(object)
        !blank?(object)
      end
    end
  end
end
