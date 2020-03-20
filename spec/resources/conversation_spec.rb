require 'spec_helper'

describe Circuit::Resources::Conversation do
  describe '.create_direct' do
    it 'creates a direct conversation' do
      label = Circuit::Resources::Conversation.create_direct(
        '2031b5d9-a391-4004-b6a7-d26bea128e51'
      )

      expect(label.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(label.participants).to eq(['2031b5d9-a391-4004-b6a7-d26bea128e51'])
    end
  end
end
