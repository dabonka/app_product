FactoryBot.define do
  factory :product do
    name {Faker::Commerce.product_name }
    price {Faker::Commerce.price(range = 1..10000.0, as_string = false) }
    association :category, factory: :category
  end
end