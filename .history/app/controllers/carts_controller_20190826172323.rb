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
        carts_check = Cart.find_by(user_id: current_user, product_id: product_params[:product_id])
        if carts_check.present?
            carts_check.quantity += product_params[:quantity]
            # @carts_check.quantity = @carts_check.quantity + product_params[:quantity]
            carts_check.save
            redirect_to carts_path
        else
            cart = Cart.new(product_params)
            cart.user_id = current_user.id
            cart.save!
        end
    end

    def update

    end

    def destroy
        @cart = Cart.find_by(params[:id])
        @cart.destroy
        redirect_to carts_path
    end



    private
    def product_params
    params.require(:cart).permit(:product_id, :quantity)
    end
end
