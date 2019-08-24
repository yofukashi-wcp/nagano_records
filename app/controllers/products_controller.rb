class ProductsController < ApplicationController
  def index

  end

  def show
    @product = Product.find(params[:id])

    unless @cart = Cart.find_by(product_id: params[:id])
      @cart = Cart.new
    end
  end
end
