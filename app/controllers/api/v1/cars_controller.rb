class Api::V1::CarsController < ApplicationController
  def index
    cars = Car.all
  end

  def create
    car = Car.new(car_params)
  end

  def update; end

  def delete; end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :registration, :user_id)
  end
end
