class ConstsController < ApplicationController

    def edit
        @postage = Const.find(1)
        @const = Const.find(params[:id])
    end

    def update
        @const = Const.find(params[:id])
        if @const.update(const_params)
            redirect_to admin_orders_path
        else
            render :edit
        end
    end

    private

    def const_params
        params.require(:const).permit(:value)
    end
end
