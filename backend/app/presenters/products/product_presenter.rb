module Products
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
        promotionPrice: @product.discount_price,
        promotionMessage: @product.discount_description,
        promotionQuantity: @product.discount_quantity,
      }
    end
  end
end
