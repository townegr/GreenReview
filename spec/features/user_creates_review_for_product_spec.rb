require 'spec_helper'

feature 'authenticated user creates a product review' do
# As an authenticated user
# I want to create a product review
# So that I can share my perspective regarding product

# ACCEPTANCE CRITERIA:
# I can optionally include a title
# I must write a description

  scenario 'add a valid product review' do
    prev_count = Review.count
    review = FactoryGirl.build(:review)
    sign_in_as(review.user)
    visit new_product_review_path(review.product)
    fill_in 'Title', with: review.title
    fill_in 'Description', with: review.description
    click_on 'Submit Review'

    expect(Review.count).to eql(prev_count + 1)
    expect(page).to have_content(review.description)
  end

  scenario 'submit an invalid product review' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.build(:review)
    prev_count = Review.count
    sign_in_as(user)
    visit new_product_review_path(review.product)
    click_on 'Submit Review'

    expect(Review.count).to eq(prev_count)
    expect(page).to have_content "can't be blank"
  end
end
