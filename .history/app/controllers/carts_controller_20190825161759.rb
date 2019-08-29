class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @cart = Cart.find(params[:id])

    end

    def create

    end

    def update

    end

    def destroy

    end
end
