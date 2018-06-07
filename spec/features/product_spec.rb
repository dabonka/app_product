require 'rails_helper'
require 'capybara/rspec'

describe  "Products", :type => :feature do

  it "Get product list" do
    product = create(:product)
    visit products_path
    expect(page).to have_content 'Listing products'
  end

  it "Pass ASC params for sorting table when click link product ID" do
    visit products_path
    click_link("ID")
    expect(current_url).to have_text "products?direction=asc&sort=id"
  end

  it "Pass sorted DESC params for sorting table when click link product ID" do
    visit products_path
    click_link("ID")
    click_link("ID")
    expect(current_url).to have_text "products?direction=desc&sort=id"
  end

  it "Pass sorted DESC params for sorting table when click link product name" do
    visit products_path
    click_link("Product Name")
    expect(current_url).to have_text "products?direction=desc&sort=name"
  end

  it "Pass sorted ASC params for sorting table when click link categories name" do
    visit products_path
    click_link("Product Name")
    click_link("Product Name")
    expect(current_url).to have_text "products?direction=asc&sort=name"
  end

  it "Pass sorted ASC params for sorting table when click link categories name" do
    visit products_path
    click_link("Category Name")
    expect(current_url).to have_text "products?direction=asc&sort=categories.name"
  end

  it "Pass sorted DESC params for sorting table when click link categories name" do
    visit products_path
    click_link("Category Name")
    click_link("Category Name")
    expect(current_url).to have_text "products?direction=desc&sort=categories.name"
  end

  it "Pass sorted ASC params for sorting table when click link categories name" do
    visit products_path
    click_link("Price")
    expect(current_url).to have_text "products?direction=asc&sort=price"
  end

  it "Pass sorted DESC params for sorting table when click link categories name" do
    visit products_path
    click_link("Price")
    click_link("Price")
    expect(current_url).to have_text "products?direction=desc&sort=price"
  end

  it "ASC Sort product by ID" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("ID")
    expect(page).to have_text "1 Synergistic Leather Plate Linen 1568 2 Aerodynamic Plastic Knife Marble 5965 3 Synergistic Paper Table Paper 5498"
  end

  it "DESC Sort product by ID" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("ID")
    click_link("ID")
    expect(page).to have_text "3 Synergistic Paper Table Paper 5498 2 Aerodynamic Plastic Knife Marble 5965 1 Synergistic Leather Plate Linen 1568"
  end

  it "DESC Sort product by Product Name" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Polyamid Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Product Name")
    expect(page).to have_text "Synergistic Leather Plate Linen 1568 3 Polyamid Paper Table Paper 5498 2 Aerodynamic Plastic Knife Marble 5965"
  end

  it "ASC Sort product by Product Name" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Polyamid Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Product Name")
    click_link("Product Name")
    expect(page).to have_text "2 Aerodynamic Plastic Knife Marble 5965 3 Polyamid Paper Table Paper 5498 1 Synergistic Leather Plate Linen 1568"
  end

  it "ASC Sort product by Category Name" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Category Name")
    expect(page).to have_text "1 Synergistic Leather Plate Linen 1568 2 Aerodynamic Plastic Knife Marble 5965 3 Synergistic Paper Table Paper 5498"
  end

  it "DESC Sort product by Category Name" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Category Name")
    click_link("Category Name")
    expect(page).to have_text "3 Synergistic Paper Table Paper 5498 2 Aerodynamic Plastic Knife Marble 5965 1 Synergistic Leather Plate Linen 1568"
  end

  it "ASC Sort product by Price" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Price")
    expect(page).to have_text "1 Synergistic Leather Plate Linen 1568 3 Synergistic Paper Table Paper 5498 2 Aerodynamic Plastic Knife Marble 5965"
  end

  it "DESC Sort product by Price" do
    data = [{:id => 1, :name => "Synergistic Leather Plate", :price => 1568, :category => create(:category, :name => "Linen")}, 
            {:id => 2, :name => "Aerodynamic Plastic Knife", :price => 5965, :category => create(:category, :name => "Marble")}, 
            {:id => 3, :name => "Synergistic Paper Table", :price => 5498, :category => create(:category, :name => "Paper")}]
    products = data.map { |p| create(:product, p) }
    visit products_path
    click_link("Price")
    click_link("Price")
    expect(page).to have_text "2 Aerodynamic Plastic Knife Marble 5965 3 Synergistic Paper Table Paper 5498 1 Synergistic Leather Plate Linen 1568"
  end

end
