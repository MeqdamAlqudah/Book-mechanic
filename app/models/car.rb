class Car < ApplicationRecord
  validates :brand, presence: true, length: { minimum: 2 }
  validates :model, presence: true, length: { minimum: 2 }
  validates :photo, presence: true, length: { minimum: 2 }
  validates :registration, presence: true, length: { minimum: 2 }
  has_many :appointments
  belongs_to :user
end
