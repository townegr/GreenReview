require 'spec_helper'
include AuthenticationHelper

feature 'user posts a product', %q{
  As a user
  I want to be able to post products
  So that people will review it.
} do

  context 'with valid attributes' do
    it 'creates a valid product' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      visit new_product_path
      fill_in 'Title', with: "Green Product Name"
      fill_in 'Description', with: "Its so green its scary"
      attach_file 'product_image', Rails.root.join('spec/support/Barcelona-23.jpg')
      click_on "Add Product"
      expect(page).to have_content("Successfully added product")
    end
  end

  context 'with invalid attributes' do
    it 'does not create a valid product' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      visit new_product_path
      click_on "Add Product"
      expect(page).to have_content("Titlecan't be blank")
      expect(page).to have_content("Descriptioncan't be blank")
    end
  end
end

