module Cart
  module Interactors
    class SubtotalCalculator
      def initialize(product_id, quantity)
        @product_id = product_id
        @quantity = quantity
      end
    
      def calculate
        product = products_boundary.find_by_id(@product_id)
    
        return 0 unless product

        subtotal = @quantity * @product.price
    
        if @product.discount_quantity && @product.discount_price
          subtotal = apply_discount
        elsif @product.discount_quantity && @product.discount_price.nil?
          subtotal = apply_buy_one_get_one_free
        end
    
        subtotal
      end
    
      private

      attr_reader :product_id
      attr_reader :quantity
    
      def apply_discount
        @quantity >= @product.discount_quantity ? @quantity * @product.discount_price : @quantity * @product.price
      end
    
      def apply_buy_one_get_one_free
        (@quantity / 2) * @product.price + (@quantity % 2) * @product.price
      end
    
      def products_boundary
        Products::Boundaries::ProductsBoundary.new
      end
    end
  end
end
