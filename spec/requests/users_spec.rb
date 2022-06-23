require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  let(:user) { create(:user) }
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:user, 5)

      get '/api/v1/users'
    end
    it 'returns all users' do
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /destroy' do
    let(:user) { create(:user) }

    before do
      delete "/api/v1/users/#{user.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
