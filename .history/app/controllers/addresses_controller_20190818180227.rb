class AddressesController < ApplicationController

    def new

    end

    def create

    end

    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
        if @adress.update
            redirect_to path
        end
    end

    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        redirect_to root_path
    end
end
