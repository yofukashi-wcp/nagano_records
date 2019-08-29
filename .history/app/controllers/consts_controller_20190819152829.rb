class ConstsController < ApplicationController

    def edit
        @name = Const.select("name")
        @value = Const.select("value")
    end

    def update

    end
end
