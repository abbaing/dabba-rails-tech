module Products
  class ProductPresenter
    def initialize(product)
      @product = product
    end

    def as_json
      {
        id: @product.id,
        code: @product.code,
        name: @product.name,
        price: @product.price,
        promotionMessage: @product.rule_descriptions
      }
    end
  end
end
