class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in

  # POST /resource/sign_in
  def create
    user = User.where(email: params[:session][:email])
    render json: user
  end

  # DELETE /resource/sign_out
  def destroy
    render json: { status => 200, message => 'Deleted succsessfuly' }
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
