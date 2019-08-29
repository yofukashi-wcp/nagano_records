class Users::UnsubscribesController < Devise::UnsubscribesController

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end