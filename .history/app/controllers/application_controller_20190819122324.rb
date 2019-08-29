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
        if resource_or_scope == :admin_user
            admin_orders_path
        else
            new_user_session_path
        end
    end
end
