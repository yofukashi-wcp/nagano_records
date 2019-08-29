class CartsController < ApplicationController
    def index
        @carts = Cart.where(user_id: current_user.id)
        @cart = Cart.where(user_id: current_user.id)
        cart_total_price(@carts)
        unless @cart then
        end
        @message = "お客様のショッピングカートに商品はありません。"
    end

    def create
        carts_check = Cart.find_by(user_id: current_user, product_id: product_params[:product_id])
        if carts_check.present?
            carts_check.quantity += product_params[:quantity].to_i
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
        cart = Cart.find(params[:id])
        carts.update(product_params)
        render :index
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

    #小計計算メソッド
    def cart_total_price(carts)
        @cart_total_price = 0
        carts.each do |cart|
            cart_subtotal_price = cart.quantity * cart.product.price
            @cart_total_price += cart_subtotal_price
        end
    end
end
