class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :phone_number, :zip_code, :address])
        end

    def after_sign_up_path_for(resource)
        products_path
    end

    def after_log_in_path_for(resource)
        products_path
    end

    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :user
          root_path
        elsif resource_or_scope == :admin
          new_admin_session_path
        else
          root_path
        end
    end
    
    def current_cart
      Cart.find(session[:cart_id])

      reacue Activerecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.def index
        cart
    end

    def search_products_data
      if params[:word].blank?
        # 全件表示
        Product.all.page(params[:page])
      else
        case params[:require].to_i
        when 1  # アーティスト名検索
          artist = Artist.find_by(name: params[:word])
          if artist.present?
            artist.products.page(params[:page])
          end

        when 2  # レーベル名検索
          label = Label.find_by(name: params[:word])
          if label.present?
            label.products.page(params[:page])
          end

        when 3  # ジャンル名検索
          genre = Genre.find_by(name: params[:word])
          if genre.present?
            genre.products.page(params[:page])
          end

        when 4  # フリーワード検索
          cross = []

          # アーティスト名検索
          artists = Artist.where("name like ?", "%" + params[:word] + "%")
          if artists.present?
            artists.each {|artist|
              cross += artist.products
            }
          end

          # レーベル名検索
          labels = Label.where("name like ?", "%" + params[:word] + "%")
          if labels.present?
            labels.each {|label|
              cross += label.products
            }
          end

          # ジャンル名検索
          genres = Genre.where("name like ?", "%" + params[:word] + "%")
          if genres.present?
            genres.each {|genre|
              cross += genre.products
            }
          end

          # 商品名検索
          products = Product.where("name like ?", "%" + params[:word] + "%")
          if products.present?
            cross += products
          end
          
          # 配列の重複要素の削除
          cross.uniq!
          cross = Kaminari.paginate_array(cross).page(params[:page])

        else  # 商品名検索（デフォルト）
          Product.where(name: params[:word]).page(params[:page])
        end
      end
    end
end
