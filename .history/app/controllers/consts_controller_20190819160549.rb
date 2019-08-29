class ConstsController < ApplicationController

    def edit
        @name = Const.fin
        @value = Const.select("value")
    end

    def update

    end
end
