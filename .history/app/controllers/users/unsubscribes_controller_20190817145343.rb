class Users::UnsubscribesController < Devise::UnsubscribesController
    def edit
        @user = User.find(params[:id])
    end

    def update

    end
end