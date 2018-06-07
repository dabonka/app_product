require 'rails_helper'

RSpec.describe Product, type: :model do
	describe "Validations" do
	  it "has a valid factory" do
	    product = create(:product)
	    expect(product).to be_valid
	  end

	  it "is not valid without a name" do
	    product = Product.new(name: nil)
	    expect(product).to_not be_valid
		end

	  it "is not valid without a price" do
	    product = Product.new(price: nil)
	    expect(product).to_not be_valid
	  end
  end

	describe "Associations" do
	  it "belongs_to category" do
	    assc = described_class.reflect_on_association(:category)
	    expect(assc.macro).to eq :belongs_to
	  end
	end
end