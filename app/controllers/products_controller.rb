class ProductsController < ApplicationController
  include CurrentUserConcern

  def index
    products = Product.all
    render json: { products: products, status: :ok }
  end

  def show
    product = set_product

    user = @current_user

    render json: { product: product, user: user, status: :ok }
  end

  private

  def set_product
    Product.find_by_id params[:id]
  end
end
