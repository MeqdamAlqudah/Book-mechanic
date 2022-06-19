class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars
  end

  def show
    car = Car.find(params[:id])
    render json: { 'brand' => car.brand, 'model' => car.model, 'registration' => car.registration, 'photo' => car.photo}
  end

  def create
    car = Car.new(car_params)

    if car.save
      render json: car
    else
      render json: car.error
    end
  end

  def update
    car = Car.find(params[:id])

    if car.update(car_params)
      render json: cars
    else
      render json: cars.error
    end
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    head :no_content, status: :ok
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :registration, :photo, :user_id)
  end
end
