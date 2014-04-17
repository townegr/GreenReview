class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    if @review.save
      redirect_to product_review_path(@product, @review)
      flash[:notice] = 'Review has been added'
      ProductReview.review_notification(@review).deliver
    else
      render 'new'
    end
  end

  def index
    @product = SOME QUERY TO GET Product
    @review = @product.review
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :user_id)
  end
end
