require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe 'password' do
    it { should have_secure_password }
  end

  describe 'auth_token' do
    it 'generates a unique auth token' do
      user = User.create(email: 'jane@example.com', password: 'password', password_confirmation: 'password')
      expect(user.auth_token).to be_present
    end
  end
end
