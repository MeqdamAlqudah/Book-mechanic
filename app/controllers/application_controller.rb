class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Helpers
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden }
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password, :current_password
      )
    end
  end
end
