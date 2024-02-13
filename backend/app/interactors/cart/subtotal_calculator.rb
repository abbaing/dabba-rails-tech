module Cart
  class SubtotalCalculator
    def initialize(company_id, product_id, quantity)
      @company_id = company_id
      @product_id = product_id
      @quantity = quantity
    end
  
    def calculate
      product = products_boundary.find_by_id(id: product_id)
    
      return 0 unless product

      subtotal = quantity * product.price
    
      if product.discount_quantity && product.discount_price
        subtotal = apply_discount(product)
      elsif product.discount_quantity && product.discount_price.nil?
        subtotal = apply_buy_one_get_one_free(product)
      end
    
      subtotal
    end
  
    private

    attr_reader :company_id
    attr_reader :product_id
    attr_reader :quantity
  
    def apply_discount(product)
      quantity >= product.discount_quantity ? 
        quantity * product.discount_price : 
        quantity * product.price
    end
  
    def apply_buy_one_get_one_free(product)
      (quantity / 2) * product.price + (quantity % 2) * product.price
    end
  
    def products_boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
