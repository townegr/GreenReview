class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])

    @review = @product.reviews.new
    if @review.save
      redirect_to @review
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
    params.require(:review).permit(:title, :description, :product_id, :user_id)
  end
end
