# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery with: :exception
  include LoggableController
  before_filter :save_log

  #before_action :configure_permitted_parameters, if: :devise_controller?

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  #end
end
