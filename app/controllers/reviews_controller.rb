class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
      flash[:notice] = 'Review has been added'
    else
      render 'new'
    end
  end

  def index
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :product_id, :user_id)
  end
end
