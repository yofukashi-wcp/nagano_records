class Users::UnsubscribesController < Devise::UnsubscribesController
    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.def destroy
        redirect_to root_path
        end
    end
end