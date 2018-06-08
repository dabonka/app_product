module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :price_from => params[:price_from], :price_to => params[:price_to], :category => params[:category], :product_name => params[:product_name]}, {:class => css_class}
  end
end
