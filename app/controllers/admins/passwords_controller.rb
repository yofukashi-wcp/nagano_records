# frozen_string_literal: true

class Admins::PasswordsController < Devise::PasswordsController
prepend_before_action :require_no_authentication, only: [:new]
append_before_action :assert_reset_token_passed, only: [:new]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    @user = current_admin
    @path = admin_password_path
  end

  # PUT /resource/password
  def update
    @admin = current_admin
    @admin.update_with_password(admins_params)
    sign_in(@admin, bypass: true)
    redirect_to products_path
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  private
  def admins_params
    params.require(:admin).permit(:password, :password_confirmation, :current_password)
  end

end
