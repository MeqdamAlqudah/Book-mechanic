class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Helpers

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden }
    end
  end

  # protected
end
