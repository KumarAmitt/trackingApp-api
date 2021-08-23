class ProductsController < ApplicationController
  include CurrentUserConcern

  def index
    products = Product.all
    render json: { products: products, status: :ok }
  end

  def show
    product = Product.find(params[:id])
    user = @current_user

    render json: { product: product, user: user, status: :ok }
  end
end
