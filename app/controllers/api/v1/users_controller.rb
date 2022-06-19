class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(address: params[:address],
          name: params[:name],
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
          photo: params[:photo],
          profession: params[:profession])

    if user.save
      render json: user
    else
      render json: user.errors.full_messages
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

private

  def user_param
  params.permit(:name, :email, :password, :password_confirmation, :phone, :profession, :address, :photo)
  end
end