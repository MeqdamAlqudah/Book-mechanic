class Appointment < ApplicationRecord
  validates :date, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 10 }
  belongs_to :user
  belongs_to :car
end
