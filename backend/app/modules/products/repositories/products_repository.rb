class ProductsRepository
  def read_all
    entities = boundary.find_all

    result = entities.map do |entity|
      serialize(entity)
    end

    result
  end

  private

  def serialize(product)
    ProductPresenter.new(product).as_json
  end

  def boundary
    ProductsBoundary.new
  end
end
