require 'spec_helper'

describe Product do
  it { should have_valid(:title).when('Green Machine') }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:description).when('Very green, very machine') }
  it { should_not have_valid(:description).when(nil, '') }

  it { should belong_to :user}
end
