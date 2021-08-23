class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: { products: products }
  end
end
