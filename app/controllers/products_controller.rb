class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :category_id)
    end
end
