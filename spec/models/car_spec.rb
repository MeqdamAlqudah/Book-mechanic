require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:user) { create(:user) }
  let(:car) { create(:car, user_id: user.id) }
  describe 'Attributes' do
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:registration) }
    it 'brand must be string' do
      expect(car.brand).to be_kind_of(String)
    end
    it 'model to  be a string' do
      expect(car.model).to be_kind_of(String)
    end
    it 'photo must be string' do
      expect(car.photo).to be_kind_of(String)
    end
    it 'registration to  be a string' do
      expect(car.registration).to be_kind_of(String)
    end
  end
end
