class CartsController < ApplicationController
    def index
        @cart_items = current_cart.cart_items

    end

    def create

    end

    def update

    end

    def destroy

    end
end
