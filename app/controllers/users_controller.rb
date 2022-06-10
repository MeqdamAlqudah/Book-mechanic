class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_param)
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(user_param)
    render json: user
  end

  def delete
    user = User.find(params[:id])
    user.destroy
    head :no_content, status: :ok
  end

  def user_param
    params.require(:user).permit(:name, :email, :password, :phone, :profession, :address)
  end
end

private
