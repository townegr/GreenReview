class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
  end

  private
  def rating_params
    params.require(:rating).permit(:user_id, :product_id, :stars)
  end

end
