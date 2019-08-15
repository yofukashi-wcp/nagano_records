class AdminProductsController < ApplicationController
  def index

  end

  def show
    # @product = Product.find(params[:id])
    @product = {
      id: 1,
      name: "時空の水",
      artist: { name: "平沢進" },
      label: { name: "ケイオスユニオン" },
      genre: { name: "ニューエイジ・ミュージック" },
      price: 1200,
      stock: 24,
      jacket_image: "",
      summary: "ふっ！"
    }
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
