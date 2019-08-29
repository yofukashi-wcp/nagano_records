class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @cart = Cart.find(params[:id])
        @total_price = @products.sum(:product_price)
    end

    def create

    end

    def update

    end

    def destroy

    end
end
