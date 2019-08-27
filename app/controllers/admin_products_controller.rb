class AdminProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = search_products_data
  end

  def show
    @product = Product.includes(:tracks).order("tracks.disc").order("tracks.number").find(params[:id])
    if @product.summary.empty?
      @product.summary = "※商品紹介はありません"
    end
  end

  def new
    @product = Product.new
    @product.artist = Artist.new
    @product.label  = Label.new
    @product.genre  = Genre.new

    @artists = Artist.all
    @labels  = Label.all
    @genres  = Genre.all
  end

  def create
    @product = Product.new(products_params)

    update_info_data(@product)
    product_save_error = @product.save
    update_track_data(@product)

    # エラー判別
    if product_save_error
      redirect_to admin_product_path(@product), notice: "商品の入力内容が登録されました。"
    else
      flash.now[:notice] = "商品の入力内容を登録できませんでした。入力内容を確認してください。"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @artists = Artist.all
    @labels  = Label.all
    @genres  = Genre.all
  end

  def update
    @product = Product.find(params[:id])

    update_info_data(@product)
    product_save_error = @product.update(products_params)
    update_track_data(@product)

    # 商品入力データ保存
    if product_save_error
      redirect_to admin_product_path(@product), notice: "商品の入力内容が登録されました。"
    else
      flash.now[:notice] = "商品の入力内容を登録できませんでした。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path
  end

  private
  # Strong Parameters
  def products_params
    params.require(:product).permit(:name, :jacket_image, :price, :stock, :summary)
  end
  def artist_params
    params.require(:product).permit(artist: :name)
  end
  def label_params
    params.require(:product).permit(label: :name)
  end
  def genre_params
    params.require(:product).permit(genre: :name)
  end
  def tracks_params
    params.require(:product).permit(tracks: [:disc, :number, :name, :length])[:tracks]
  end

  # トラック更新
  def update_track_data(product)
    # 既存トラック削除
    product.tracks.each {|num|
      unless tracks_params.key?(num['id'].to_s)
        track = Track.find(num['id'])
        track.destroy
      end
    }

    # トラック追加・変更
    tracks_params.each {|key, value|
      if product.tracks.find_by(id: key).nil?
        track = Track.new(value)
        track.product_id = product.id
        track.save
      else
        track = Track.find(key)
        track.update(value)
      end
    }
  end

  # 商品情報更新
  def update_info_data(product)
    # アーティストデータ追加・反映
    artist = Artist.find_by(name: artist_params['artist']['name'])
    if artist.nil?
      artist = Artist.new(artist_params['artist'])
      artist.save
    end
    product.artist_id = artist.id

    # レーベルデータ追加・更新
    label = Label.find_by(name: label_params['label']['name'])
    if label.nil?
      label = Label.new(label_params['label'])
      label.save
    end
    product.label_id = label.id

    # ジャンルデータ追加・更新
    genre = Genre.find_by(name: genre_params['genre']['name'])
    if genre.nil?
      genre = Genre.new(genre_params['genre'])
      genre.save
    end
    product.genre_id = genre.id
  end
end
