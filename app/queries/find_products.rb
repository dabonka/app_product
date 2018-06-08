class FindProducts
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = initial_scope
    scoped = search(scoped, params[:product_name])
    scoped = price_from(scoped, params[:price_from])
    scoped = price_to(scoped, params[:price_to])
    scoped = filter_by_category(scoped, params[:category])
    scoped
  end

  private def search(scoped, query = nil)
    (query && query.length > 0) ? scoped.where("name LIKE ?", "%#{query}%") : scoped
  end

  private def price_from(scoped, price_from = nil)
    (price_from && price_from.length > 0) ? scoped.where('price > ?', price_from.to_i) : scoped
  end

  private def price_to(scoped, price_to = nil)
    (price_to && price_to.length > 0) ? scoped.where('price < ?', price_to.to_i) : scoped
  end

  private def filter_by_category(scoped, category = nil)
    (category && category.length > 0)  ? scoped.where(category: category) : scoped
  end

end