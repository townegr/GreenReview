require 'spec_helper'

describe User do

  describe 'Validations' do
    it { should have_valid(:username).when('leprechaun') }
    it { should_not have_valid(:username).when(nil, '') }
  end

  describe '#age' do
    it 'should give age' do
      user = FactoryGirl.create(:user, email: 'greg@leprechaun.com')
      expect(user.age).to eq(42)
    end
  end
end
