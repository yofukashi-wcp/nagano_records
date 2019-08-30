class ProductsController < ApplicationController
  def index
    @products, @length = search_products_data

    unless @cart = Cart.find_by(product_id: params[:id])
      @cart = Cart.new
    end
  end

  def show
    @product = Product.includes(:tracks).order("tracks.disc").order("tracks.number").find(params[:id])
    if @product.summary.empty?
      @product.summary = "※商品紹介はありません"
    end

    unless @cart = Cart.find_by(product_id: params[:id])
      @cart = Cart.new
    end
  end
end
