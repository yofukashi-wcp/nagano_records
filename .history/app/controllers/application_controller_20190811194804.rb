class ApplicationController < ActionController::Base
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :phone_number, :zip_code, :address])
        end

    def after_sign_in_path_for(resource)
        products_path
    end

    def after_log_in_path_for(resource)
        products_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end
end
