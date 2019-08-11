class Users::AccountsController < ApplicationController
  def index
    @user = current_user
    @user_edit = edit_user_registration_path
  end
end
