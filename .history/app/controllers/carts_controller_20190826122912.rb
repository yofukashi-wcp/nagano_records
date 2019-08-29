class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @products = Product.all
        @total_price = @products.sum(:price)
    end

    def create
        cart = Cart.new(product_params)
        cart.user_id = current_user.id
        cart.save!
    end

    def update

    end

    def destroy
        cart = Cart.find(params[:id])
        cart.destroy
        redirect_to carts_path



    private
    def product_params
    params.require(:cart).permit(:product_id, :quantity)
    end
end
