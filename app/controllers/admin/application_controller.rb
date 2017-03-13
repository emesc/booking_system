class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :verify_admin
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout 'admin/application'

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

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
