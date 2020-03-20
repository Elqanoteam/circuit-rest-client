require 'spec_helper'

describe CircuitApi::Client do
  subject(:client) do
    described_class.new(
      client_id: '123456',
      client_secret: '67890',
      sandbox: false
    )
  end

  describe '.base_url' do
    it { expect(client.base_url).to eq('https://www.circuit.com/') }

    context 'when in sandbox' do
      before { client.sandbox = true }

      it { expect(client.base_url).to eq('https://circuitsandbox.net/') }
    end
  end

  describe '.api_url' do
    it { expect(client.api_url).to eq(URI('https://www.circuit.com/rest/v2/')) }

    context 'when in sandbox' do
      before { client.sandbox = true }

      it { expect(client.api_url).to eq(URI('https://circuitsandbox.net/rest/v2/')) }
    end
  end
end
