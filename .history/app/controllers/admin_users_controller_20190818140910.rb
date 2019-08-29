class AdminUsersController < ApplicationController
    def index

    end

    def show

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(book_params)
        redirect_to admin_user_path
    end
end
