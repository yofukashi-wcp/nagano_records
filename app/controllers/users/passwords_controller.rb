# frozen_string_literal: true
# Users::PasswordsController < Devise::Controller　=>　Users::PasswordsController < ApplicationController
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
  # ユーザーパスワードの編集
  def edit
    @user = current_user
    @path = user_password_path
  end

  # PUT /resource/password
  # ユーザーパスワード更新
  def update
        @user = current_user
    if  @user.update(users_params)
        sign_in(@user, bypass: true)
        flash[:success] = "パスワードの更新に成功しました！"
        redirect_to users_path
    else
        falsh[:failure] = "パスワードの更新に失敗しました！"
        render :edit
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  # ストロングパラメーター追加　
  private
  def users_params
    params.require(:user).permit(:password)
  end

end
