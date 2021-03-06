require 'spec_helper'

describe User do

  describe 'Validations' do
    it { should have_valid(:username).when('leprechaun') }
    it { should_not have_valid(:username).when(nil, '') }

    it { should have_many(:products).dependent(:nullify)}
  end
end
