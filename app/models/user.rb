class User < ApplicationRecord
  has_many :appointments
  has_many :cars
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is?(requested_role)
    role == requested_role.to_s
  end
end
