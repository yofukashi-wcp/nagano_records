class ProductsController < ApplicationController
  def index
    if params[:word].blank?
      # 全件表示
      @products = Product.all
    else
      case params[:require].to_i
      when 1  # アーティスト名検索
        artist = Artist.find_by(name: params[:word])
        if artist.present?
          @products = artist.products
        end
      when 2  # レーベル名検索
        label = Label.find_by(name: params[:word])
        if label.present?
          @products = label.products
        end
      when 3  # ジャンル名検索
        genre = Genre.find_by(name: params[:word])
        if genre.present?
          @products = genre.products
        end
      else  # アーティスト名検索（デフォルト）
        @products = Product.where(name: params[:word])
      end
    end

    if @product.blank?
      # 検索結果なし
      @product = []
    end

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
