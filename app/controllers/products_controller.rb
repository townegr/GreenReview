class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
      flash[:notice] = "Successfully added product"
    end
  end

  def index
  end

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
