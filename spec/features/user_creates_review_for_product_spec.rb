require 'spec_helper'

feature 'authenticated user creates a product review' do
# As an authenticated user
# I want to create a product review
# So that I can share my perspective regarding product

# ACCEPTANCE CRITERIA:
# I can optionally include a title
# I must write a description

  scenario 'add a valid product review' do
    review = FactoryGirl.build(:review)
    prev_count = Review.count

    sign_in_as(review.user)
    visit new_review_path
    fill_in 'review_title', with: review.title
    fill_in 'review_description', with: review.description
    select "#{review.product.title}", from: 'Product'
    click_on 'Submit Review'

    expect(Review.count).to eq(prev_count + 1)
    expect(page).to have_content(review.description)
  end

  scenario 'submit an invalid product review' do
    user = FactoryGirl.create(:user)
    prev_count = Review.count
    sign_in_as(user)
    visit new_review_path
    click_on 'Submit Review'

    expect(Review.count).to eq(prev_count)
    expect(page).to have_content "can't be blank"
  end
end
