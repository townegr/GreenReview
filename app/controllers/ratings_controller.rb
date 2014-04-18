class RatingsController < ApplicationController
  def create
  @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.json { render json: @rating, status: :created }
      else
        flash[:error] = "Your rating may not have been saved"
      end
    end
  end

  def update
    @rating = Rating.find_by(user: current_user, product_id: rating_params[:product_id])
    respond_to do |format|
      if @rating.update(rating_params)
        format.json { render json: @rating, status: :created }
      else
        flash[:error] = "Your rating may not have been updated"
      end
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:product_id, :stars).merge(user: current_user)
  end

end
