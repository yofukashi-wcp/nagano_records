class AdminUsersController < ApplicationController
# ユーザー一覧
    def index
        @users = User.search(params[:search]).order(id: :desc).page(params[:page]).per(10)
    end
# ユーザー詳細
    def show
        @user = User.find(params[:id])
    end
# ユーザー情報編集
    def edit
        @user = User.find(params[:id])
    end
# ユーザー情報更新
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to admin_user_path(@user)
        else
            render :edit
        end
    end
# ユーザー退会
    def destroy
        @user = User.find(params[:id])
        if  @user.destroy
            redirect_to admin_users_path
        else
            render :show
        end
    end
# ストロングパラメーター追加
    private
        def user_params
            params.require(:user).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :zip_code, :address, :phone_number, :email)
        end
end
