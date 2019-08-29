# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super

  # end

  def create
      if admin_signed_in?
          sign_out current_admin
      end
      super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
