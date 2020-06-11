require 'spec_helper'

describe CircuitApi::Resources::MessageItem do
  subject(:resource) { described_class.new(client) }
  let(:client) { CircuitApi::Client.new }

  describe '.find' do
    it 'finds a conversation item' do
      item = resource.find('00000000-3333-1111-2222-777777777777')

      expect(item.item_id).to eq('00000000-3333-1111-2222-777777777777')
      expect(item.type).to eq('TEXT')
    end
  end

  describe '.all' do
    it 'retrieves the list of items of the a conversation' do
      result = resource.all('00000000-3333-1111-2222-777777777777')

      expect(result.count).to eq(1)

      item = result.first
      expect(item.item_id).to eq('00000000-3333-1111-2222-777777777777')
    end
  end

  describe '.update' do
    it 'updates a conversation item' do
      item = resource.update(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777',
        subject: 'foo'
      )

      expect(item.item_id).to eq('00000000-3333-1111-2222-777777777777')
      expect(item.type).to eq('TEXT')
    end
  end

  describe '.delete' do
    it 'deletes a conversation item' do
      item = resource.delete(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(item.item_id).to eq('00000000-3333-1111-2222-777777777777')
      expect(item.type).to eq('TEXT')
    end
  end

  describe '.pin' do
    it 'pins a conversation item' do
      conversation = resource.pin(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(conversation.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
    end
  end

  describe '.unpin' do
    it 'unpins a conversation item' do
      conversation = resource.unpin(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(conversation.conv_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
    end
  end

  describe '.flag' do
    it 'flags a conversation item' do
      response = resource.flag(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777',
        item_creation_time: 1591862121321
      )

      expect(response).to be_nil
    end
  end

  describe '.unflag' do
    it 'unflags a conversation item' do
      response = resource.unflag(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(response).to be_nil
    end
  end

  describe '.like' do
    it 'likes a conversation item' do
      response = resource.like(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(response).to be_nil
    end
  end

  describe '.unlike' do
    it 'unlikes a conversation item' do
      response = resource.unlike(
        '2031b5d9-a391-4004-b6a7-d26bea128e51',
        '00000000-3333-1111-2222-777777777777'
      )

      expect(response).to be_nil
    end
  end
end
