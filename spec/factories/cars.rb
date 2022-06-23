FactoryBot.define do
  factory :car do
    brand { 'BMW' }
    model { 'GT_200' }
    registration { '29|3424' }
    photo { 'http://photo' }
  end
end
