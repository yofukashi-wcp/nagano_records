class AdminProductsController < ApplicationController
  def index

  end

  def show
    @product = Product.find(params[:id])
  end

  def new

  end

  def edit
    # @product = Product.find(params[:id])
    @product = Product.find(1)
  end

  def update

  end

  def destroy

  end
end
