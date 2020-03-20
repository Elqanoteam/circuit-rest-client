require 'spec_helper'

describe CircuitApi::Utils::Attributes do
  subject(:attributes) { described_class }

  describe '.snake_keys' do
    context 'when value is a hash' do
      let(:value) do
        {
          'Item' => '42',
          'WebhookId' => '123456'
        }
      end

      it 'converts keys to snake case' do
        expect(attributes.snake_keys(value))
          .to eq({ item: '42', webhook_id: '123456' })
      end
    end

    context 'when value is an array' do
      let(:value) do
        [
          { 'Item' => '42' },
          { 'WebhookId' => '123456' }
        ]
      end

      it 'converts keys to snake case' do
        expect(attributes.snake_keys(value))
          .to eq([{ item: '42' }, { webhook_id: '123456' }])
      end
    end

    context 'when value is of another type' do
      let(:value) { 'WebhookId' }

      it 'returns the value' do
        expect(attributes.snake_keys(value)).to eq(value)
      end
    end
  end

  describe '.snake_hash_keys' do
    let(:value) do
      {
        'Item' => '42',
        'WebhookId' => '123456'
      }
    end

    it 'converts hash keys to snake case' do
      expect(attributes.snake_keys(value))
        .to eq({ item: '42', webhook_id: '123456' })
    end
  end

  describe '.underscore_key' do
    let('value') { 'WebhookId' }

    it 'converts string to snake case' do
      expect(attributes.underscore_key(value)).to eq('webhook_id')
    end

    context 'when value is a symbol' do
      let(:value) { 'WebhookId'.to_sym }

      it 'converts symbol to snake case' do
        expect(attributes.underscore_key(value)).to eq(:webhook_id)
      end
    end

    context 'when value is of another type' do
      let(:value) { 123546 }

      it 'returns the value' do
        expect(attributes.underscore_key(value)).to eq(value)
      end
    end
  end

  describe '.underscore' do
    let('value') { 'WebhookId' }

    it 'converts string to snake case' do
      expect(attributes.underscore(value)).to eq('webhook_id')
    end
  end

  describe '.camelize_keys' do
    let(:value) do
      {
        'item' => '42',
        'webhook_id' => '123456'
      }
    end

    it 'converts keys to camel case' do
      expect(attributes.camelize_keys(value))
        .to eq({ 'item' => '42', 'webhookId' => '123456' })
    end

    context 'when a key is a symbol' do
      let(:value) do
        {
          item: '42',
          webhook_id: '123456'
        }
      end

      it 'converts keys to camel case as symbols' do
        expect(attributes.camelize_keys(value))
          .to eq({ item: '42', webhookId: '123456' })
      end
    end

    context 'when value contains an array' do
      let(:value) do
        {
          'item' => '42',
          'webhook_item' => [{ 'webhook_id' => '123456' }]
        }
      end

      it 'converts keys to camel case in the array' do
        expect(attributes.camelize_keys(value))
          .to eq({ 'item' => '42', 'webhookItem' => [{ 'webhookId' => '123456' }]})
      end
    end
  end
end
