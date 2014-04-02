require 'spec_helper'

feature "User can sign in" do
# As a user,
# I can securely log in
# so I can access my account.

#  Acceptance Criteria
# *A created user can sign in.
# *A user must provide email and password on sign in.

  it 'signs in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end
end
