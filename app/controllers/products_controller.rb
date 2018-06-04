class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @products = Product.includes(:category).order(sort_column+ " " + sort_direction).page(params[:page]).per(50)
  end

  def show
    @product = Product.find(params[:id])
  end
 
  def new
  end

  private
  
  def sort_column
  	params[:sort] 
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
