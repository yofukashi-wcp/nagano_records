class AdminProductsController < ApplicationController
  def index

  end

  def show
    @product = Product.includes(:tracks).order("tracks.disc").order("tracks.number").find(params[:id])
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
    product = Product.find(params[:id])
    
    # トラック追加・更新
    tracks_params.each {|key, value|
      if product.tracks.select {|n| n['id'] == key} == []
        track = Track.new(value)
        track.product_id = product.id
      else
        track = Track.find(key)
        track.update(value)
      end
      track.save
    }

    # トラック削除
    product.tracks.each {|num|
      unless tracks_params.key?(num['id']) 
        track = Track.find(num['id'])
        track.destroy
      end
    }

    product.update(products_params)
    if product.save
      redirect_to admin_product_path(product), notice: "商品の編集内容が反映されました。"
    else
      flash.now[:notice] = "商品の編集内容を登録できませんでした。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_product_path
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
end
