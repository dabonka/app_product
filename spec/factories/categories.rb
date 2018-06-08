FactoryBot.define do
  factory :category do
    title {Faker::Commerce.material}
  end
end