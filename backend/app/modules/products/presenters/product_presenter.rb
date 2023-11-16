class ProductPresenter
  def initialize(product)
    @product = product
  end

  def as_json
    {
      id: @product.id,
      code: @product.product_code,
      name: @product.name,
      price: @product.price,
    }
  end
end
