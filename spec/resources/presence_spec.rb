require 'spec_helper'

describe Circuit::Resources::Presence do
  describe '.all' do
    it 'retrieves the list of presence' do
      result = Circuit::Resources::Presence.all(
        user_ids: ['d8c17f9d-df42-4045-91b5-160c108e86e7']
      )

      expect(result.count).to eq(1)

      presence = result.first
      expect(presence.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(presence.state).to eq('ACTIVE')
    end
  end

  describe '.find' do
    it 'retrieves the list of presence' do
      presence = Circuit::Resources::Presence.find(
        'd8c17f9d-df42-4045-91b5-160c108e86e7'
      )

      expect(presence.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(presence.state).to eq('ACTIVE')
    end
  end

  describe '.update' do
    it 'retrieves the list of presence' do
      presence = Circuit::Resources::Presence.update(
        state: 'ACTIVE'
      )

      expect(presence.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(presence.state).to eq('ACTIVE')
    end
  end
end
