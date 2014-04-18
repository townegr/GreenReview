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
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    redirect_to product_reviews
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :user_id)
  end
end
