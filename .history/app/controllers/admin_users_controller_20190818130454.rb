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
        @user.update
    end
end
