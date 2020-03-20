require 'spec_helper'

describe Circuit::Resources::Webhook do
  describe '.all' do
    it 'retrieves the list of webhooks' do
      result = Circuit::Resources::Webhook.all

      expect(result.count).to eq(1)

      webhook = result.first
      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end

  describe '.get' do
    it 'retrieves the a webhook' do
      webhook = Circuit::Resources::Webhook.get('8b637a4d-75e3-445a-88ea-01979d4008ef')

      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end

  describe '.create' do
    it 'creates a webhook' do
      webhook = Circuit::Resources::Webhook.create(
        url: 'https://test/webhooks/circuit',
        filter: [
          'CONVERSATION.CREATE',
          'CONVERSATION.UPDATE',
          'CONVERSATION.ADD_ITEM',
          'CONVERSATION.UPDATE_ITEM',
        ]
      )

      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end

  describe '.delete' do
    it 'deletes a webhook' do
      response = Circuit::Resources::Webhook.delete('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(response).to be_nil
    end
  end

  describe '.delete_all' do
    it 'deletes all webhooks' do
      response = Circuit::Resources::Webhook.delete_all
      expect(response).to be_nil
    end
  end

  describe '.update' do
    it 'creates a webhook' do
      webhook = Circuit::Resources::Webhook.update(
        '8b637a4d-75e3-445a-88ea-01979d4008ef',
        url: 'https://test/webhooks/circuit',
        filter: [
          'CONVERSATION.CREATE',
          'CONVERSATION.UPDATE',
          'CONVERSATION.ADD_ITEM',
          'CONVERSATION.UPDATE_ITEM',
        ]
      )

      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end

  describe '.create_presence' do
    it 'creates a webhook' do
      webhook = Circuit::Resources::Webhook.create_presence(
        url: 'https://test/webhooks/circuit',
        user_ids: [
          '4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2',
          'bd24f120-70a9-4848-97b5-bcdcfbaf4156',
        ]
      )

      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end

  describe '.update_presence' do
    it 'creates a webhook' do
      webhook = Circuit::Resources::Webhook.update_presence(
        '8b637a4d-75e3-445a-88ea-01979d4008ef',
        url: 'https://test/webhooks/circuit',
        user_ids: [
          '4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2',
          'bd24f120-70a9-4848-97b5-bcdcfbaf4156',
        ]
      )

      expect(webhook.id).to eq('8b637a4d-75e3-445a-88ea-01979d4008ef')
      expect(webhook.user_id).to eq('d8c17f9d-df42-4045-91b5-160c108e86e7')
      expect(webhook.type).to eq('MANUAL')
      expect(webhook.url).to eq('https://test/webhooks/circuit')
      expect(webhook.creation_time).to eq(1584622990411)
      expect(webhook.filter).to eq([
        'CONVERSATION.CREATE',
        'CONVERSATION.UPDATE',
        'CONVERSATION.ADD_ITEM',
        'CONVERSATION.UPDATE_ITEM',
      ])
    end
  end
end
