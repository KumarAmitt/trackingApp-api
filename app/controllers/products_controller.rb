class ProductsController < ApplicationController
  include CurrentUserConcern

  def index
    if @current_user
      products = Product.all
      render json: { products: products, status: :ok }
    else
      render json: { status: 401 }
    end
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
