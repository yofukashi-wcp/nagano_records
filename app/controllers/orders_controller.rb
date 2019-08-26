class OrdersController < ApplicationController

    def index
        @user = User.find(params[:id])
    end

    def new
        @carts = Cart.where(user_id: current_user.id)
        cart_total_price(@carts)
        
        
    end

    def check

    end

    def update

    end

    private

    def order_params
        params.require(:cart).permit(:product_id, :quantity)
    end
    def cart_total_price(carts)
        @cart_total_price = 0
        carts.each do |cart|
            cart_subtotal_price = cart.quantity * cart.product.price
            @cart_total_price += cart_subtotal_price
        end
    end
end
