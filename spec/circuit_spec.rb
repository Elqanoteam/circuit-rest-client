require 'spec_helper'

describe Circuit do
  describe '.base_url' do
    it { expect(described_class.base_url).to eq('https://www.circuit.com/') }

    context 'when in sandbox' do
      around do |example|
        Circuit.sandbox = true
        example.run
        Circuit.sandbox = false
      end

      it { expect(described_class.base_url).to eq('https://circuitsandbox.net/') }
    end
  end

  describe '.api_url' do
    it { expect(described_class.api_url).to eq(URI('https://www.circuit.com/rest/v2/')) }

    context 'when in sandbox' do
      around do |example|
        Circuit.sandbox = true
        example.run
        Circuit.sandbox = false
      end

      it { expect(described_class.api_url).to eq(URI('https://circuitsandbox.net/rest/v2/')) }
    end
  end
end
