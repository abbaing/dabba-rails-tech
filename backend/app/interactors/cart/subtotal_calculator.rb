module Cart
  class SubtotalCalculator
    def initialize(company_id, product_id, quantity)
      @company_id = company_id
      @product_id = product_id
      @quantity = quantity
    end
  
    def calculate
      product = products_boundary.find_by_id(id: product_id)
      return 0 unless product.company_id == company_id
      return 0 unless product

      subtotal = quantity * product.price
      subtotal += apply_rules(product, subtotal)

      subtotal
    end
  
    private

    attr_reader :company_id
    attr_reader :product_id
    attr_reader :quantity
  
    def apply_rules(product, subtotal)
      rules = ProductRule.where(product_id: product.id, active: true)
      total_adjustment = 0
  
      rules.each do |rule|
        total_adjustment += calculate_rule_adjustment(rule, subtotal)
      end
  
      total_adjustment
    end
  
    def calculate_rule_adjustment(rule, subtotal)
      case rule.rule_type
      when "discount_percentage"
        subtotal * (rule.rule_parameter / 100)
      when "discount_fixed"
        rule.rule_parameter
      # new rules here
      else
        0
      end
    end
  
    def products_boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
