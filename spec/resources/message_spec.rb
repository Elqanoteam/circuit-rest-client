require 'spec_helper'

describe CircuitApi::Resources::Message do
  subject(:resource) { described_class.new(client) }
  let(:client) { CircuitApi::Client.new }

  describe '.create' do
    it 'creates a message in a conversation' do
      message = resource.create(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        { content: 'Hello from API!' }
      )

      expect(message.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(message.item_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
    end

    context 'with item_id' do
      it 'creates a message in the item' do
        message = resource.create(
          '2031b5d9-a391-4004-b6a7-d26bea128e51',
          {
            item_id: '00000000-3333-1111-2222-777777777777',
            content: 'Hello from API!'
          }
        )

        expect(message.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
        expect(message.item_id).to eq('00000000-3333-1111-2222-777777777777')
      end
    end

    context 'with invalid user' do
      it 'raises a ValidationError' do
        expect do
          message = resource.create(
            '00000000-3333-1111-2222-777777777777',
            { content: 'Hello from API!' }
          )
        end.to raise_error(CircuitApi::ValidationError)
      end
    end
  end
end
