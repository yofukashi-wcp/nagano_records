class ApplicationController < ActionController::Base

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:mail, :password, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :phone_number, :zip_code, :address])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:])
    end

    def after_sign_in_path_for(resource)
      flash[:notice] = "Welcome! You have signed up successfully."
      user_path(@user)
    end

    def after_log_in_path_for(resource)
      flash[:notice] = "Signed in successfully."
      user_path(@user)
    end

    def after_sign_out_path_for(resource)
      flash[:notice] = "Signed out successfully."
      root_path
    end
end
