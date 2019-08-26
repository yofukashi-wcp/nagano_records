class OrdersController < ApplicationController

    def index
        @user = User.find(params[:id])
    end

    def new
        @user = current_user
        @cart = Cart.find(params[:id])
        
    end

    def check

    end

    def update

    end
end
