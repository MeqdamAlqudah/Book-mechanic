require "bcrypt"
FactoryBot.define do
  factory :user do
     name {"John"}
     phone {"079291421"}
     profession {"Programmer"}
     address {"Amman-Jordan"}
     sequence(:email) { |n| "#{name.downcase}#{n}@test.com" }
     password { 'password' }
     password_confirmation { 'password' }
  end
end
