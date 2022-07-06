class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars
  end

  def show
    car = Car.find(params[:id])
    render json: { 'brand' => car.brand, 'model' => car.model, 'registration' => car.registration,
                   'photo' => car.photo }
  end

  def create
    car = Car.new(car_params)
    if User.where(id: params[:user_id])[0].role == 'admin'
      if car.save
        render json: car
      else
        render json: car.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: { 'error' => 'You are not authorized to do this action' }, status: 333

    end
  end

  def update
    car = Car.find(params[:id])

    if car.update(car_params)
      render json: car
    else
      render json: car.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    car = Car.find(params[:id])
    if User.where(id: params[:user_id])[0].role == 'admin'

      car.destroy
      head :no_content, status: :ok
    else
      render json: { 'error' => 'You are not authorized to do this action' }, status: 333

    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :registration, :photo, :user_id)
  end
end
