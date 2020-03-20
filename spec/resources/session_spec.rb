require 'spec_helper'

describe Circuit::Resources::Session do
  describe '.all' do
    it 'retrieves the list of rtc sessions' do
      result = Circuit::Resources::Session.all

      expect(result.count).to eq(1)

      session = result.first
      expect(session.label_id).to eq('string')
      expect(session.value).to eq('string')
    end
  end
end
