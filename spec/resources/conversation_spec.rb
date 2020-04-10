require 'spec_helper'

describe CircuitApi::Resources::Conversation do
  subject(:resource) { described_class.new(client) }
  let(:client) { CircuitApi::Client.new }

  describe '.create_direct' do
    let(:participant_id) { '2031b5d9-a391-4004-b6a7-d26bea128e51' }

    it 'creates a direct conversation' do
      conversation = resource.create_direct(participant_id)

      expect(conversation.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(conversation.participants).to eq([participant_id])
    end

    context 'with an HTTP 409' do
      let(:participant_id) { '00000000-3333-1111-2222-777777777777' }

      it 'returns the existing conversation' do
        conversation = resource.create_direct(participant_id)

        expect(conversation.conv_id).to eq('00000000-3333-1111-2222-777777777777')
        expect(conversation.participants).to eq([participant_id])
      end
    end
  end
end
