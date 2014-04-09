class ProductReview < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_review.review_notification.subject
  #
  def review_notification(review)
    @review = review
    mail to: review.product.user.email,
      subject: 'Product Review'
  end
end
