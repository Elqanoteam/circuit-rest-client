require 'spec_helper'

describe Circuit::Resources::RtcSession do
  subject(:resource) { described_class.new(client) }
  let(:client) { Circuit::Client.new }

  describe '.all' do
    it 'retrieves the list of rtc sessions' do
      result = resource.all

      expect(result.count).to eq(1)

      session = result.first
      expect(session.label_id).to eq('string')
      expect(session.value).to eq('string')
    end
  end
end
