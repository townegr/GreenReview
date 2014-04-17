class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
    @review = @product.reviews.build
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to products_path
      flash[:notice] = "Successfully added product"
    else
      render new_product_path
    end
  end

  def index
    @products = Product.all
    @ratings = Rating.where(user: current_user)
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render action: 'edit'
    end
  end

  def product_params
    params.require(:product).permit(:title, :description, :image, :user_id)
  end
end
