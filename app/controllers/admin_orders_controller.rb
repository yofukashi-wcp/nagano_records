class AdminOrdersController < ApplicationController

    def index
        @orders = Order.page(params[:page]).reverse_order

    end

    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products.all
    end

    def update
        order = Order.find(params[:id])


    	

        order.update(order_params)
        orderproducts = order.order_products
        order_total = 0
        orderproducts.each do |orderproduct|
            orderproduct.update(price: orderproduct.quantity * orderproduct.product.price)
            order_total += orderproduct.price
        end
        order.update(total: order_total += order.postage)


    	redirect_to admin_order_path(order.id)
    end
    
    private
    def order_params


        params.require(:order).permit(:status,order_products_attributes: [:id,:quantity])


    end
end
