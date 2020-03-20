require 'spec_helper'

describe Circuit::Resources::Message do
  describe '.create' do
    it 'creates a message in a conversation' do
      label = Circuit::Resources::Message.create(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        { content: 'Hello from API!' }
      )

      expect(label.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(label.item_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
    end
  end
end
