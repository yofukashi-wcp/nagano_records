class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @total_price = @products.sum(:price)
    end

    def create

    end

    def update

    end

    def destroy

    end
end
