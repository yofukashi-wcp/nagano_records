class AdminOrdersController < ApplicationController

    def index
        @orders = Order.all

    end

    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products.all
    end

    def update

    end
end
