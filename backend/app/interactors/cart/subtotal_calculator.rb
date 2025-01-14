module Cart
  class SubtotalCalculator
    def initialize(company_id, product_id, quantity)
      @company_id = company_id
      @product_id = product_id
      @quantity = quantity
    end

    def calculate
      product = find_product

      unless product && product.company_id == company_id
        return {
          subtotal: 0,
          two_plus_one: false,
          discount_price: false,
          promotion: ''
        }
      end

      base_price = product.price
      discount = calculate_discount(base_price, product, quantity)

      subtotal = (base_price * quantity) - discount

      rule = find_applicable_rule(product, quantity)
      two_plus_one = buy_one_get_one_free?(rule, quantity)
      discount_price = discount_price?(rule, quantity)

      {
        subtotal:,
        two_plus_one:,
        discount_price:,
        promotion: rule&.description || ''
      }
    end

    private

    attr_reader :company_id, :product_id, :quantity

    def find_product
      products_boundary.find_by_id(id: @product_id)
    end

    def calculate_discount(base_price, product, quantity)
      rule = find_applicable_rule(product, quantity)

      return 0 unless rule

      case rule.rule_type
      when 'buy_one_get_one_free'
        return (quantity / 2 * base_price) if quantity >= 2
      when 'bulk_discount', 'coffee_discount'
        return (quantity * rule.rule_parameter) if quantity >= rule.rule_minimum_quantity
      end

      0
    end

    def find_applicable_rule(_product, quantity)
      rule = ProductRule.where(product_id: @product_id)
      return unless rule

      rule.find { |item| rule_applies?(item, quantity) }
    end

    def rule_applies?(rule, quantity)
      return if quantity.zero?

      case rule.rule_type
      when 'buy_one_get_one_free'
        quantity >= rule.rule_minimum_quantity
      when 'bulk_discount', 'coffee_discount'
        quantity >= rule.rule_minimum_quantity
      end
    end

    def buy_one_get_one_free?(rule, quantity)
      return false unless rule
      return false unless quantity

      quantity >= 2 && rule.rule_type == 'buy_one_get_one_free'
    end

    def discount_price?(rule, quantity)
      return false unless rule
      return false unless quantity

      quantity >= rule.rule_minimum_quantity &&
        (rule.rule_type == 'bulk_discount' ||
        rule.rule_type == 'coffee_discount')
    end

    def products_boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
