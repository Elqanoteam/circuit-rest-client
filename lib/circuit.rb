require 'net/http'
require 'uri'
require 'json'

require 'circuit/version'

require 'circuit/utils/connection'
require 'circuit/utils/errors'
require 'circuit/utils/attributes'
require 'circuit/utils/object'

require 'circuit/resources/base'
require 'circuit/resources/conversation'
require 'circuit/resources/label'
require 'circuit/resources/presence'
require 'circuit/resources/rtc_session'
require 'circuit/resources/user'
require 'circuit/resources/webhook'

module Circuit
  API_BASE_URL = 'https://www.circuit.com/'.freeze
  API_SANDBOX_BASE_URL = 'https://circuitsandbox.net/'.freeze
  API_PATH_BASE = 'rest/v2/'.freeze

  class << self
    attr_accessor :api_client_id, :api_client_secret, :sandbox, :bearer_token, :logger

    def base_url
      return API_SANDBOX_BASE_URL if sandbox

      API_BASE_URL
    end

    def api_url
      URI.join(base_url, API_PATH_BASE)
    end
  end
end
