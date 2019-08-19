class ConstsController < ApplicationController

    def edit
        @name = Const.find(1)
        @const
    end

    def update

    end
end
