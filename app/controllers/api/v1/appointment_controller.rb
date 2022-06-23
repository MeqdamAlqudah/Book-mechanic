class Api::V1::AppointmentController < ApplicationController
  def index
    appointments = Appointment.where(user_id: params[:user_id])
    render json: appointments
  end

  def create
    appointment = Appointment.new(description: params[:description],
                                  city: params[:city],
                                  date: params[:date],
                                  user_id: params[:user_id],
                                  car_id: params[:car_id])

    if appointment.save
      render json: appointments
    else
      render json: appointments.error
    end
  end

  def update
    appointment = Appointment.find(params[:id])

    if appointment.update(appointment_params)
      render json: appointments
    else
      render json: appointment_params.error
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    head :no_content, status: :ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description, :city, :date, :user_id, :car_id)
  end
end
