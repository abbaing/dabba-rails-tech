module Cart
  class SubtotalCalculator
    def initialize(company_id, product_id, quantity)
      @company_id = company_id
      @product_id = product_id
      @quantity = quantity
    end
  
    def calculate
      product = find_product

      return 0 unless product.company_id == company_id
      return 0 unless product
      
      base_price = product.price
      discount = calculate_discount(base_price, product, quantity)
  
      subtotal = (base_price * quantity) - discount

      rule = find_applicable_rule(product, quantity)
      two_plus_one = is_buy_one_get_one_free?(rule, quantity)
      discount_price = is_discount_price?(rule, quantity)

      { 
        subtotal: subtotal,
        two_plus_one: two_plus_one,
        discount_price: discount_price,
        promotion: rule&.description || ""
      }
    end
  
    private

    attr_reader :company_id
    attr_reader :product_id
    attr_reader :quantity
  
    private

    def find_product
      products_boundary.find_by_id(id: @product_id)
    end

    def calculate_discount(base_price, product, quantity)
      rule = find_applicable_rule(product, quantity)
  
      if rule
        rule_type = rule.rule_type
        rule_parameter = rule.rule_parameter
  
        case rule_type
        when "buy_one_get_one_free"
          if quantity >= 2
            quantity / 2 * base_price
          else
            0
          end
        when "bulk_discount"
          if quantity >= rule.rule_minimum_quantity
            # Calculate discounted price for entire quantity
            quantity * rule_parameter
          else
            0
          end
        when "coffee_discount"
          if quantity >= rule.rule_minimum_quantity
            # Calculate discounted price per unit and apply to each unit
            base_price * rule_parameter * quantity
          else
            0
          end
        end
      else
        0
      end
    end
  
    def find_applicable_rule(product, quantity)
      ProductRule
        .where(product_id: @product_id)
        .find { |rule| rule_applies?(rule, quantity) }
    end
  
    def rule_applies?(rule, quantity)
      case rule.rule_type
      when "buy_one_get_one_free"
        quantity >= rule.rule_minimum_quantity
      when "bulk_discount", "coffee_discount"
        quantity >= rule.rule_minimum_quantity
      end
    end

    def is_buy_one_get_one_free?(rule, quantity)
      return false unless rule
      return false unless quantity
      quantity >= 2 && rule.rule_type == "buy_one_get_one_free"
    end

    def is_discount_price?(rule, quantity)
      return false unless rule
      return false unless quantity
      quantity >= rule.rule_minimum_quantity &&
      (rule.rule_type == "bulk_discount" || 
      rule.rule_type == "coffee_discount")
    end
  
    def products_boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
