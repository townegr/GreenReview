require 'spec_helper'

feature "User adds entry to registry" do
# As a user,
# I want to securely register for an account,
# so that I can keep track of my activity.

#  Acceptance Criteria
# *A sign up and authentication system for your users (with Devise)
# *I must provide  an unused email
# *I must provide a password
# *Provide an option for first name and last name

  it "can sign up" do
    count = User.count
    visit new_user_registration_path
    fill_in 'Email', with: 'hi@gmail.com'
    fill_in 'Username', with: 'leprechaun'
    fill_in 'user_password', with: 'princely'
    fill_in 'user_password_confirmation', with: 'princely'
    click_on 'Sign Up'

    expect(page).to have_content "Welcome"
    expect(User.count).to eql(count + 1)
  end
end
