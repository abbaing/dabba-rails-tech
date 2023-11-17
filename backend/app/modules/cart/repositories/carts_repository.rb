class CartsRepository
  def calculate_subtotal(product_id, quantity)
    product = products_boundary.find_by_id(product_id)

    return 0 unless product

    subtotal_calculator = SubtotalCalculator.new(product, quantity)
    subtotal_calculator.calculate
  end

  private

  def products_boundary
    ProductsBoundary.new
  end
end
