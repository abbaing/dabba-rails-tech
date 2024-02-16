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
      discount = calculate_discount(product, quantity)
  
      (base_price * quantity) - discount
    end
  
    private

    attr_reader :company_id
    attr_reader :product_id
    attr_reader :quantity
  
    private

    def find_product
      products_boundary.find_by_id(id: @product_id)
    end

    def calculate_discount(product, quantity)
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
      ProductRule.active
        .where(product_id: @product_id)
        .order(rule_priority: :desc)
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
  
    def products_boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
