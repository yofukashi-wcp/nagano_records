module DeviseHelper
    def devise_error_messages!
      return "" if resource.errors.empty?

      html = ""
      messages = resource.errors.full_messages.each do |errmsg|
        html += <<-EOF
        <div class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            #{errmsg}
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">Save changes</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
                #{errmsg}
        </div>
        </div>
        EOF
      end
      html.html_safe
    end

    def devise_error_messages?
      resource.errors.empty? ? false : true
    end

  end