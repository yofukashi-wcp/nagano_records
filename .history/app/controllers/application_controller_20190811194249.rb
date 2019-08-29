class ApplicationController < ActionController::Base
    protected



    def after_sign_in_path_for(resource)
        products_path
    end

    def after_log_in_path_for(resource)
        products_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end
end
