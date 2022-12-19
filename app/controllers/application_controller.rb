class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :current_user

    before_action :configured_permitted_parameters, if: :devise_controller?
  
    private
  
    def configured_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:email, :password)
      end
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:first_name, :last_name, :email, :password)
      end
    end
  end