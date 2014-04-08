require 'spec_helper'

feature 'User that added product recieves email when another user reviews product', %q{
  As a user who added a product
  I want to recieve email when the product is reviewed
  So that I can see what other people think
} do
  #Acceptance Criteria
  # An email is sent to the owner of an item when a new review is posted about it

  context 'when a valid product is created' do
    it 'sends an email to the product owner' do
      ActionMailer::Base.deliveries = []
      prev_count = ActionMailer::Base.deliveries.count
      review = FactoryGirl.create(:review)
      sign_in_as(review.user)

      visit new_review_path
      fill_in 'review_title', with: review.title
      fill_in 'review_description', with: review.description
      select "#{review.product.title}", from: 'Product'
      click_on 'Submit Review'


      last_email = ActionMailer::Base.deliveries.last
      expect(ActionMailer::Base.deliveries.count).to eql(prev_count + 1)
      expect(last_email).to have_subject('Product Review')
      expect(last_email).to have_body_text("Your product #{review.product.title} was reviewed by #{review.user.username}")
      expect(last_email).to deliver_to(review.product.user.email)
    end
  end
end

