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

      reacue Activerecord::RecordnotFound
        cart = Cart.create
        session[:cart_id] = cart.def index
        cart
    end

end
