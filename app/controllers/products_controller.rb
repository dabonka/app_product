class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = FindProducts.new(Product.includes(:category)).call(permitted_params).order(sort_column + " " + sort_direction).page(params[:page]).per(50)
  end

  def show
    @product = Product.find(params[:id])
  end
 
  def new
  end

  private
  
  def permitted_params
    params.permit(:product_name, :price_from, :price_to, :category, :direction, :sort, :utf8, :authenticity_token)
  end

  def sort_column
  	params[:sort] ? params[:sort] : "name" 
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
