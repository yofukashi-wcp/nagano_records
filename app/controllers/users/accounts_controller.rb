class Users::AccountsController < ApplicationController
  # マイページ
  def index
    @user = current_user
  end
  
end
