class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :verify_admin
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout 'admin/application'

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:role_id, :email, :password, :password_confirmation, :first_name, :last_name)
      end
    end

  private

    def verify_admin
      unless current_user.try(:admin?)
        redirect_to root_url
        flash[:danger] = "You are not authorized to access this page."
      end
    end
end
