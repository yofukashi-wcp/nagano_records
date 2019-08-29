class Users::UnsubscribesController < ApplicationController

    def edit
        @user = User.find()
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end