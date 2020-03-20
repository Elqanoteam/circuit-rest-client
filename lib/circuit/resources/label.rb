module Circuit
  module Resources
    class Label < Base
      class << self
        def api_resource
          'users/labels'
        end
      end
    end
  end
end
