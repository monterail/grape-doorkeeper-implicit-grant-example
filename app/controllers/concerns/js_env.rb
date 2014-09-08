module JsEnv
  extend ActiveSupport::Concern
  included do
    helper_method :js_env
  end

  def js_env
    data = {
      host: ENV['HOST'],
      application_id: ENV['APPLICATION_ID']
    }

    <<-EOS.html_safe
      <script type="text/javascript">
        shared = angular.module('myApp')
        shared.constant('Rails', #{data.to_json})
      </script>
    EOS
  end
end

