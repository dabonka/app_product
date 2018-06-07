class FindProducts
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:search])
    scoped = filter_by_price(scoped, params[:from_price], params[:to_price])
    scoped = filter_by_properties(scoped, parmas[:properties])
    scoped = filter_by_category(scoped, params[:category_id])
    scoped = sort(scoped, params[:sort_type], params[:sort_direction]
    scoped = paginate(scoped, params[:page]
    scoped
  end

  private def search(scoped, query = nil)
    query ? scoped.where("title ILIKE '%?%'", query) : scoped
  end

  private def filter_by_price(scoped, from = nil, to = nil)
    from ? scoped.where('price > ?', from_price) : scoped
    to ? scoped.where('price < ?', to_price) : scoped
  end

  private def filter_by_properties(scoped, properties = nil)
    if properties
      scoped.joins(:product_properties).where(property_id: properties)
    else
      scoped
    end 
  end 

  private def filter_by_category(scoped, category_id = nil)
    category_id ? scoped.where(category_id: category_id) : scoped
  end

  private def sort(scoped, sort_type = :desc, sort_direction = :price) 
    scoped.order(sort_type => sort_direction)
  end

  private def paginate(scoped, page_number = 0)
    scoped.page(page_number)
  end
end