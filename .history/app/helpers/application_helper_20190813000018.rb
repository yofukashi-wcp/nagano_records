module ApplicationHelper
    def devise_error_messages
        return "" if resource.errors.empty?
        errors_html = ""
        resource.errors.full_messages.each do |err_msg|
          errors_html += <<-EOF
            <div class="error_field alert alert-danger" role="alert">
              <p class="error_msg">#{err_msg}</p>
            </div>
          EOF
        end
        errors_html.html_safe
      end

end
