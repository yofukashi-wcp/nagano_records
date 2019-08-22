class AddressesController < ApplicationController

    def new
        @path = addresses_path
        @address = Address.new
    end

    def create
        address = Address.new(address_params)
        address.user_id = current_user.id
        address.save!
        redirect_to root_path
    end

    def edit
        @path = address_path
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
        if @address.update(address_params)
            redirect_to users_path
        else
            render :edit
        end
    end

    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to users_path
    end

    private
# Applicationcontroller継承の為、ストロングパラメーター設定
    def address_params
        params.require(:address).permit(:name, :zip_code, :address)
    end

end
