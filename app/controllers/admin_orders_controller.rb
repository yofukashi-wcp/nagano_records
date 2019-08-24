class AdminOrdersController < ApplicationController

    def index
        @orders = Order.page(params[:page])

    end

    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products.all
    end

    def update
        order = Order.find(params[:id])
    	order.update(status: params[:status])
    	redirect_to admin_order_path(order.id)
    end
    
    private
    def order_params
        params.require(:order).permit(:status)
    end
end
