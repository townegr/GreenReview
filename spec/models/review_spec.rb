require 'spec_helper'

describe Review do
  it { should have_valid(:description).when('This is my description') }
  it { should_not have_valid(:description).when(nil, '') }
end
