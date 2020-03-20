require 'spec_helper'

describe Circuit::Resources::Message do
  subject(:resource) { described_class.new(client) }
  let(:client) { Circuit::Client.new }

  describe '.create' do
    it 'creates a message in a conversation' do
      label = resource.create(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        { content: 'Hello from API!' }
      )

      expect(label.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(label.item_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
    end
  end
end
