class AdminProductsController < ApplicationController
  def index

  end

  def show
    @product = Product.find(params[:id])
  end

  def new

  end

  def edit
    @product = Product.find(params[:id])
    @artists = Artist.all
    @labels  = Label.all
    @genres  = Genre.all
  end

  def update

  end

  def destroy

  end
end
