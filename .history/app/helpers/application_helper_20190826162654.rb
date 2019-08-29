module ApplicationHelper
    def devise_error_messages!
        return "" if resource.errors.empty?

        html = ""
        messages = resource.errors.full_messages.each do |errmsg|
          html += <<-EOF
          <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert">
              <span aria-hidden="true">&times;</span>
              <span class="sr-only">close</span>
            </button>
            #{errmsg}
          </div>
          EOF
        end
        html.html_safe
    end

      helper_method :current_cart

    def current_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
end
