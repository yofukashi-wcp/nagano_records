class CartsController < ApplicationController
    def index
        @carts = Cart.all
        @products = Product.all
        @total_price = @products.sum(:price)
        @cart = Cart.find_by(params[:id])
        unless @cart then
        end
    end

    def create
        cart = Cart.new(product_params)
        cart.user_id = current_user.id
        cart.save!
    end

    def update

    end

    def destroy
        @cart.destroy
        redirect_to carts_path
    end



    private
    def product_params
    params.require(:cart).permit(:product_id, :quantity)
    end
end
