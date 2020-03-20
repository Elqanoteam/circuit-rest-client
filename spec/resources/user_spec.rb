require 'spec_helper'

describe Circuit::Resources::User do
  describe '.all' do
    it 'retrieves the list of users' do
      result = Circuit::Resources::User.all

      expect(result.count).to eq(1)

      user = result.first
      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end

  describe '.search' do
    it 'retrieves the list of users' do
      result = Circuit::Resources::User.search(name: ['bot@test.com'])

      expect(result.count).to eq(1)

      user = result.first
      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end

  describe '.profile' do
    it 'retrieves the list of users' do
      user = Circuit::Resources::User.profile

      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end

  describe '.update_profile' do
    it 'retrieves the list of users' do
      user = Circuit::Resources::User.update_profile(
        locale: 'EN_US'
      )

      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end

  describe '.find' do
    it 'retrieves the list of users' do
      user = Circuit::Resources::User.find('2031b5d9-a391-4004-b6a7-d26bea128e51')

      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end

  describe '.find_by_email' do
    it 'retrieves the list of users' do
      user = Circuit::Resources::User.find_by_email('bot@test.com')

      expect(user.user_id).to eq('2031b5d9-a391-4004-b6a7-d26bea128e51')
      expect(user.avatar).to eq('a76302a9-aa2a-421f-b061-b2052f2047a5')
      expect(user.avatar_large).to eq('92144ecc-6604-4a7f-a607-e66e7b35f014')
      expect(user.display_name).to eq('Elqano BOT')
      expect(user.first_name).to eq('Elqano')
      expect(user.last_name).to eq('BOT')
      expect(user.email_address).to eq('bot@test.com')
      expect(user.user_type).to eq('BOT')
      expect(user.user_state).to eq('ACTIVE')
    end
  end
end