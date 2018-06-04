require 'faker'

if Rails.env.development?

  categories = []
  products = []
  
  10.times do |i|
    categories << Category.create(name: Faker::Commerce.material)
  end

  1000.times do |i|
    products << Product.create(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        category: categories.sample
    )
  end

end
