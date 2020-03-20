module CircuitApi
  class Client
    attr_accessor :client_id, :client_secret, :sandbox, :token

    def initialize(client_id: nil, client_secret: nil, sandbox: nil)
      @client_id = client_id
      @client_secret = client_secret
      @sandbox = sandbox
    end

    def connect(token)
      # TODO: fetch oauth token
      @token = token
    end

    def base_url
      return CircuitApi::API_SANDBOX_BASE_URL if sandbox

      CircuitApi::API_BASE_URL
    end

    def api_url
      URI.join(base_url, CircuitApi::API_PATH_BASE)
    end

    def conversations
      CircuitApi::Resources::Conversation.new(self)
    end

    def labels
      CircuitApi::Resources::Label.new(self)
    end

    def messages
      CircuitApi::Resources::Message.new(self)
    end

    def presence
      CircuitApi::Resources::Presence.new(self)
    end

    def rtc_sessions
      CircuitApi::Resources::RtcSession.new(self)
    end

    def users
      CircuitApi::Resources::User.new(self)
    end

    def webhooks
      CircuitApi::Resources::Webhook.new(self)
    end
  end
end
