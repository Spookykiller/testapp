class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id, :allowed_to_log_in, :avatar, :user_name, :user_gender, :user_function, :user_phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:company_id, :allowed_to_log_in, :avatar, :user_name, :user_gender, :user_function, :user_phone])
    end

    def layout_by_resource
      if devise_controller?
        "devise_layout"
      else
        "application"
      end
    end
end
