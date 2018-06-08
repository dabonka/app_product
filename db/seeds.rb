require 'faker'

if Rails.env.development? || Rails.env.production?

  categories = []
  products = []
  
  10.times do |i|
    categories << Category.create(title: Faker::Commerce.material)
  end

  1000.times do |i|
    products << Product.create(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price(range = 1..10000.0, as_string = false),
        category: categories.sample
    )
  end

end
