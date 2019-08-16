# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
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
    @user = current_user
    @index = users_path
  end

  # PUT /resource/password
  def update
    @user = current_user
    if  @user.update(users_params)
        redirect_to users_path
    else
        render :edit
    end
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
  def users_params
    params.require(:user).permit(:password)
  end

end
