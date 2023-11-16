class CartsRepository
  def calculate_subtotal(product_id, quantity)
    product = products_boundary.find_by_id(product_id)

    return 0 unless product

    subtotal = product.price * quantity
    subtotal = apply_discount_rules(product, quantity, subtotal)

    subtotal
  end

  private

  def products_boundary
    ProductsBoundary.new
  end

  def apply_discount_rules(product, quantity, subtotal)
    if product.discount_quantity && product.discount_price
      apply_discount(product, quantity)
    elsif product.discount_quantity && product.discount_price.nil?
      apply_buy_one_get_one_free(product, quantity)
    else
      quantity * product.price
    end
  end

  def apply_discount(product, quantity)
    quantity >= product.discount_quantity ? quantity * product.discount_price : quantity * product.price
  end

  def apply_buy_one_get_one_free(product, quantity)
    (quantity / 2) * product.price + (quantity % 2) * product.price
  end
end
