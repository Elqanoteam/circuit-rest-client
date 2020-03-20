module Circuit
  class Client
    attr_accessor :client_id, :client_secret, :sandbox, :token

    def initialize(client_id: nil, client_secret: nil, sandbox: nil)
      @client_id = client_id
      @client_secret = client_secret
      @sand_box = sandbox
    end

    def connect(token)
      # TODO: fetch oauth token
      @token = token
    end

    def base_url
      return Circuit::API_SANDBOX_BASE_URL if sandbox

      Circuit::API_BASE_URL
    end

    def api_url
      URI.join(base_url, Circuit::API_PATH_BASE)
    end

    def conversations
      Circuit::Resources::Conversation.new(self)
    end

    def labels
      Circuit::Resources::Label.new(self)
    end

    def messages
      Circuit::Resources::Message.new(self)
    end

    def presence
      Circuit::Resources::Presence.new(self)
    end

    def rtc_sessions
      Circuit::Resources::RtcSession.new(self)
    end

    def users
      Circuit::Resources::User.new(self)
    end

    def webhooks
      Circuit::Resources::Webhook.new(self)
    end
  end
end
