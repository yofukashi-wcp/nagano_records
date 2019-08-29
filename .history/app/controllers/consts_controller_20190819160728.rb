class ConstsController < ApplicationController

    def edit
        @const = Const.find(params[:id])
    end

    def update

    end
end
