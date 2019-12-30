module LoggableController
  def save_log
    controller = params[:controller]
    action = params[:action]
    request_type = restful_method(params)
    #return if !audit_get_request?(LOGGABLE_CONTROLLER_CONFIG) && request_type == 'get'
    #description = LOGGABLE_CONTROLLER_CONFIG[controller][action] rescue "#{controller} - #{action}"
    return if controller == 'devise/sessions'

    Log.create!(:action => action, :controller => controller,
        :user_name => current_user.try(:email),
        #:description => description,
        :parameters =>  params.inspect,
        :remote_ip => request.remote_ip,
        :restful_method => restful_method(params)
    )
  end
  private
  def audit_get_request?(audit_config)
    audit_config["audit_get_request"]
  end

  def restful_method(params)
    return request.method.downcase
  end
end
