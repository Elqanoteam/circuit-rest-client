require 'spec_helper'

describe Circuit::Resources::Label do
  describe '.all' do
    it 'retrieves the list of labels of the user' do
      result = Circuit::Resources::Label.all

      expect(result.count).to eq(2)

      label = result.first
      expect(label.label_id).to eq('4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2')
      expect(label.value).to eq('Label1')
    end
  end

  describe '.delete' do
    it 'deletes a label' do
      label = Circuit::Resources::Label.delete('4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2')
      expect(label.label_id).to eq('4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2')
      expect(label.value).to eq('Label1')
    end
  end

  describe '.create' do
    it 'creates a label' do
      label = Circuit::Resources::Label.create(
        labe: 'Label 1'
      )

      expect(label.label_id).to eq('4ba7e51c-8d5a-43a5-8f47-a96c30ad13c2')
      expect(label.value).to eq('Label1')
    end
  end
end
