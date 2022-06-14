class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_param)

    if user.save
      render json: user
    else
      render json: user.error
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_param)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content, status: :ok
  end

  def user_param
    params.require(:user).permit(:name, :email, :password, :phone, :profession, :address, :photo)
  end
end

private
