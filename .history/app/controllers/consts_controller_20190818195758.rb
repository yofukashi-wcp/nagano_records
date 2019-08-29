class ConstsController < ApplicationController

    def edit
        @admin = Admin.find(params[:id])
    end

    def update

    end
end
