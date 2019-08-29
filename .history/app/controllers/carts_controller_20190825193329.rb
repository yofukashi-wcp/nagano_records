class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @products = Product.all
        @total_price = @products.sum(:price)
    end

    def create
        cart = Cart.new(product_params)

    end

    def update

    end

    def destroy

    end

    private
    def product_params
    params.require(:cart).permit(:product_id, :quantity)
    end
end
