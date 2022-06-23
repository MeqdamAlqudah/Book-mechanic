

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:user) { create(:user) }
  let(:car) {create(:car,user_id:user.id)}
  let(:appointment) { create(:appointment, user_id: user.id,car_id:car.id) }
  describe 'Attributes' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
    it 'date must be string' do
      expect(appointment.date).to be_kind_of(ActiveSupport::TimeWithZone)
    end
    it 'd description be a string' do
      expect(appointment.description).to be_kind_of(String)
    end

  end
end
