module DeviseHelper
    def devise_error_messages!
      return "" if resource.errors.empty?

      msg = ""
      messages = resource.errors.full_messages.each do |errmsg|
        msg += errmsg = '\n'
      end

      html = <<-EOF
      <script>
      alert("#{errmsg}");
      </script>
      EOF
      html.html_safe
    end

    def devise_error_messages?
      resource.errors.empty? ? false : true
    end

  end