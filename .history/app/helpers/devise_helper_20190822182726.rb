module DeviseHelper
    def devise_error_messages!
      return "" if resource.errors.empty?

      html = ""
      msg = ""
      messages = resource.errors.full_messages.each do |errmsg|
        html += <<-EOF
        msg += errmsg = '\n'
        EOF
      end
      <script>
      alert("#{errmsg}");
    </script>

      html.html_safe
    end

    def devise_error_messages?
      resource.errors.empty? ? false : true
    end

  end