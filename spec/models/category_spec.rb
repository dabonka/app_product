require 'rails_helper'

RSpec.describe Category, type: :model do

	describe "Validations" do
	  it "has a valid factory" do
	    category = create(:category)
	    expect(category).to be_valid
	  end

	  it "is not valid without a title" do
	    category = Category.new(title: nil)
	    expect(category).to_not be_valid
	  end
	end

	describe "Associations" do
	  it "has many products" do
	    assc = described_class.reflect_on_association(:products)
	    expect(assc.macro).to eq :has_many
	  end
	end
end