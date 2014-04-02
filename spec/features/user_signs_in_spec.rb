require 'spec_helper'

feature "User can sign in" do
# As a user,
# I can securely log in
# so I can access my account.

#  Acceptance Criteria
# *A created user can sign in.
# *A user must provide email and password on sign in.

  it 'signs in' do
    user = User.create!(email:'bob@gmail.com', password:'hi', password_confirmation: 'hi' )
    visit new_sessions_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign In'
    expect(page).to have_content 'Welcome'
  end
end
