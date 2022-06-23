require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  let(:user) { create(:user) }
  let(:car) { create(:car, user_id: user.id) }
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:car, 5, { user_id: user.id })

      get "/api/v1/users/#{user.id}/cars"
    end
    it 'returns all cars' do
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST /create' do
    context 'with valid parameters' do
      let(:user) { create(:user) }
      let(:my_car) { create(:car, user_id: user.id) }

      before do
        post "/api/v1/users/#{user.id}/cars", params:
                          { car: {

                            brand: my_car.brand,
                            model: my_car.model,
                            registration: my_car.registration,
                            photo: my_car.photo,
                            user_id: my_car.user_id
                          } }
      end

      it 'returns the brand' do
        expect(json['brand']).to eq(my_car.brand)
      end
      it 'returns the model' do
        expect(json['model']).to eq(my_car.model)
      end
      it 'returns the registration' do
        expect(json['registration']).to eq(my_car.registration)
      end
      it 'returns the photo' do
        expect(json['photo']).to eq(my_car.photo)
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
        post "/api/v1/users/#{user.id}/cars", params:
                          { 'car' => {
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

    before do
      delete "/api/v1/users/#{user.id}/cars/#{car.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
