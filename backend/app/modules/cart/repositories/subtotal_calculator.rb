class SubtotalCalculator
  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def calculate
    subtotal = @quantity * @product.price

    if @product.discount_quantity && @product.discount_price
      subtotal = apply_discount
    elsif @product.discount_quantity && @product.discount_price.nil?
      subtotal = apply_buy_one_get_one_free
    end

    subtotal
  end

  private

  def apply_discount
    @quantity >= @product.discount_quantity ? @quantity * @product.discount_price : @quantity * @product.price
  end

  def apply_buy_one_get_one_free
    (@quantity / 2) * @product.price + (@quantity % 2) * @product.price
  end
end
