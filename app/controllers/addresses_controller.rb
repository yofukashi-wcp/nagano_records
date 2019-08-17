class AddressesController < ApplicationController

    def new

    end

    def create

    end

    def edit

    end

    def update

    end
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to users_path
    end
end
