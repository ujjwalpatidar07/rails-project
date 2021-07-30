class Api::V1::ProductsController < Api::V1::ApiApplicationController
  skip_before_action :verify_authenticity_token  

  def index
    products = Product.all
    render json: {products: products}
  end

  def show
    product = Product.find_by_id(params[:id])
    if product.present?
      render json: {product: product}
    else
      render json: {error: 'product not found'}
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: {product: product}
    else
      render json: {error: product.errors.full_messages.to_sentence}
    end
  end

  def destroy
    product = Product.find_by_id(params[:id])
    if product.present? && product.destroy
      render json: {message: 'product destroyed'}
    else
      render json: {error: 'product not found'}
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end 
end
