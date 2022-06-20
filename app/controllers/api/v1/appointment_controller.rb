class Api::V1::AppointmentController < ApplicationController
  def index
    appointments = Appointment.where(user_id: params[:user_id])
    render json: appointments
  end

  def create
    appointment = Appointment.new(appointment_params)

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
    params.require(:appointment).permit(:description, :date)
  end
end
