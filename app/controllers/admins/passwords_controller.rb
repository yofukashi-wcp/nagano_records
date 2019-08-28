# frozen_string_literal: true

class Admins::PasswordsController < Devise::PasswordsController
  # ログイン済みはnewアクション以外を実行できる
prepend_before_action :require_no_authentication, only: [:new]
# パスワードの更新にreset_token_passedを執拗としない
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
    @admin = current_admin
    @path = admin_password_path
  end

  # PUT /resource/password
  def update
    @admin = current_admin
    if  @admin.update_with_password(admins_params)
        sign_in(@admin, bypass: true)
        # flash[:notice]にすると表示されず、ログイン後にymlファイルのsigned_in: "サインインしました"が表示される"
        flash[:success] = "パスワードの更新に成功しました！"
        redirect_to products_path
    else
        @path = admin_password_path
        flash.now[:failure] = 'パスワードの更新に失敗しました！'
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
  def admins_params
    params.require(:admin).permit(:password, :password_confirmation, :current_password)
  end

end
