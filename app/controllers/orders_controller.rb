class OrdersController < ApplicationController

    def index

        @user = current_user

        @orders = Order.where(user_id: current_user).includes(:order_products).page(params[:page]).reverse_order


    end

    def new
        @user = current_user
        @order = Order.new
        @path = order_addresses_path
        @address = Address.new
        @carts = Cart.where(user_id: current_user.id)
        cart_total_price(@carts)
        @const = Const.find(1)
    end

    def create
        # オーダーのレコード
        @order = Order.new
        @order.user_id = current_user.id
        # 渡ってきたパラメーター(id)が0でなければ新規追加した住所が送付先住所になる処理
        if  params[:address].to_i != 0 
            @address = Address.find(order_params[:address].to_i)
            @order.zip_code = @address.zip_code
            @order.address = @address.address
            @order.name = @address.name
        else
            @order.user_id = current_user.id
            @order.zip_code = current_user.zip_code
            @order.address = current_user.address
            @order.name = current_user.last_name+current_user.first_name
        end
        
        @order.payment = order_params[:payment].to_i
        @order.phone_number = current_user.phone_number
        @order.postage = Const.find(1).value
        @carts = Cart.where(user_id: current_user.id)
        @user = current_user
        @const = Const.find(1)
        cart_total_price(@carts)
        # 在庫数以上に購入出来なくする処理 >>>>>>>>
         a_name = []
        @carts.each do |cart|
            if cart.quantity > cart.product.stock then
                a_name.push(cart.product.name)
            end
        end
        unless a_name.empty?
            flash[:notice] = a_name.join(",") + "の在庫が足りない為注文できません"
            redirect_to new_order_path and return
        end
        # ここまで========
        # 小計と送料の合計金額
        @order.total = @cart_total_price + Const.find(1).value
        if @order.save
            # 注文商品のレコード
            @carts.each do |cart|
                order_product = OrderProduct.new
                order_product.order_id = @order.id
                order_product.product_id = cart.product.id
                order_product.quantity = cart.quantity
                order_product.price = cart.product.price
                order_product.save
                product = Product.find(cart.product.id)
                # 商品の在庫から購入した商品数を引く処理
                product.stock = product.stock - order_product.quantity
                product.save
                cart.destroy
            end
            redirect_to orders_check_path
        else
            render :new
        end
        
    end

    def check 
        @order = current_user.orders.order(created_at: "ASC").last
    end

    def update
        order = Order.find(params[:id])
    	order.update(status: params[:status])
    	redirect_to orders_path(order.id)
    end

    private

    def order_params
        params.require(:order).permit(:address, :zip_code, :name, :payment, :status)
    end
    def cart_total_price(carts)
        @cart_total_price = 0
        @cart_total_quantity = 0
        carts.each do |cart|
            cart_subtotal_price = cart.quantity * cart.product.price
            @cart_total_quantity += cart.quantity
            @cart_total_price += cart_subtotal_price
        end
    end
end
