require 'net/http'
require 'uri'
require 'json'

require 'circuit_api/version'
require 'circuit_api/client'
require 'circuit_api/resource'

require 'circuit_api/utils/connection'
require 'circuit_api/utils/errors'
require 'circuit_api/utils/attributes'
require 'circuit_api/utils/object'

require 'circuit_api/resources/base'
require 'circuit_api/resources/conversation'
require 'circuit_api/resources/label'
require 'circuit_api/resources/message'
require 'circuit_api/resources/presence'
require 'circuit_api/resources/rtc_session'
require 'circuit_api/resources/user'
require 'circuit_api/resources/webhook'

module CircuitApi
  API_BASE_URL = 'https://www.circuit.com/'.freeze
  API_SANDBOX_BASE_URL = 'https://circuitsandbox.net/'.freeze
  API_PATH_BASE = 'rest/v2/'.freeze

  class << self
    attr_accessor :logger
  end
end
