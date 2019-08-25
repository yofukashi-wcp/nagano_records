# frozen_string_literal: true

class Users::PasswordsController < ApplicationController
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
    @path = user_password_path
  end

  # PUT /resource/password
  def update
        @user = current_user
    if  @user.update_with_password(users_params)
        sign_in(@user, bypass: true)
        flash[:success] = "パスワードの更新に成功しました！"
        redirect_to users_path
    else
        @path = user_password_path
        flash[:failure] = "パスワードの更新に失敗しました！"
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
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

end
