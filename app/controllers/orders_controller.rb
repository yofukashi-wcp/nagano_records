class OrdersController < ApplicationController

    def index
        @orders = Order.where(user_id: current_user).includes(:order_products).page(params[:page]).reverse_order

    end

    def new
        @carts = Carts.all

    end

    def create
        @order = Order.new(order_params)
        @order.save
        render 'check'
    end

    # def check 
    #     @order

    # end

    def update
        order = Order.find(params[:id])
    	order.update(status: params[:status])
    	redirect_to orders_path(order.id)
    end

    private
    def order_params
        params.require(:order).permit(:status)
    end
end
