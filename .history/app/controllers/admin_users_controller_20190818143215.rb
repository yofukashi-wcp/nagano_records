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
        if @user.update(user_params)
        redirect_to admin_user_path(@user)
        else
            render :edit
        end
        logger.debug @user.errors.inspect
    end

    private
        def user_params
            params.require(:user).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :zip_code, :address, :phone_number, :email)
        end
end
