class OrdersController < ApplicationController

    def index
        @orders = Order.includes(:order_products).page(params[:page]).reverse_order

    end

    def new

    end

    def check
        @order = Order.last

    end

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
