class ConstsController < ApplicationController

    def edit
        @const = Const.find(params[:id])
    end

    def update
        @const = Const.find(params[:id])
        if @const.update(const_params)
            redirect_to admin_orders_path
        end
    end
end
