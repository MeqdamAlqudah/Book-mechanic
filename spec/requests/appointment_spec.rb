require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  let(:user) { create(:user) }
  let(:car) { create(:car, user_id: user.id) }
  let(:appointment) { create(:appointment, user_id: user.id, car_id: car.id) }
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:appointment, 5, { user_id: user.id, car_id: car.id })

      get "/api/v1/users/#{user.id}/appointment"
    end
    it 'returns all appointments' do
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST /create' do
    context 'with valid parameters' do
      let(:user) { create(:user) }
      let(:car) { create(:car, user_id: user.id) }
      let(:my_appointment) { create(:appointment, user_id: user.id, car_id: car.id) }

      before do
        post "/api/v1/users/#{user.id}/appointment", params:
                          { appointment: {
                            description: my_appointment.description,
                            city: my_appointment.city,
                            date: my_appointment.date,
                            user_id: user.id,
                            car_id: car.id
                          } }
      end

      it 'returns the title' do
        expect(json['description']).to eq(my_appointment.description)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      let(:user) { create(:user) }
      let(:car) { create(:car, user_id: user.id) }
      let(:my_appointment) { create(:appointment, user_id: user.id, car_id: car.id) }

      before do
        post "/api/v1/users/#{user.id}/appointment", params:
                          { 'appointment' => {
                            'description' => '',
                            'date' => '',
                            'user_id' => user.id,
                            'car_id' => car.id
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  describe 'DELETE /destroy' do
    let(:user) { create(:user) }
    let(:car) { create(:car, user_id: user.id) }
    let!(:appointment) { FactoryBot.create(:appointment, user_id: user.id, car_id: car.id) }

    before do
      delete "/api/v1/users/#{user.id}/appointment/#{appointment.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
