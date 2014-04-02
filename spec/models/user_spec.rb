require 'spec_helper'

describe User do

  describe 'Validations' do
    it { should have_valid(:username).when('leprechaun') }
    it { should_not have_valid(:username).when(nil, '') }
  end

  describe '#summary' do

    it 'returns a user summary' do
      user = FactoryGirl.create(:user, email: 'goats@gmail.com')
      expect(user.summary).to eql("#{user.email}")
    end
  end
end
