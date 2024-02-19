require 'rails_helper'

RSpec.describe Cart::SubtotalCalculator do
  let(:company_id) { 1 }
  let(:product_id) { 1 }
  let(:quantity) { 5 }
  let(:calculator) { described_class.new(company_id, product_id, quantity) }
  let(:product) { instance_double('Product', company_id:, price: 10) }
  let(:product_rule) { instance_double('Product Rule') }
  let(:product_rules) { nil }

  before do
    allow_any_instance_of(described_class).to receive(:find_product).and_return(product)
    allow(ProductRule).to receive(:where).and_return(product_rules)
  end

  describe '#calculate' do
    context 'when product belongs to the given company and product exists' do
      let(:product_rules) { nil }

      it 'returns the correct subtotal without any discounts' do
        expect(calculator.calculate[:subtotal]).to eq(50)
      end

      it 'returns two_plus_one false' do
        expect(calculator.calculate[:two_plus_one]).to be_falsey
      end

      it 'returns discount_price false' do
        expect(calculator.calculate[:discount_price]).to be_falsey
      end

      it 'returns an empty string for promotion' do
        expect(calculator.calculate[:promotion]).to eq('')
      end
    end

    context 'when product does not exist' do
      before do
        allow_any_instance_of(described_class).to receive(:find_product).and_return(nil)
      end

      it 'returns 0 as subtotal' do
        expect(calculator.calculate[:subtotal]).to eq(0)
      end

      it 'returns false for two_plus_one' do
        expect(calculator.calculate[:two_plus_one]).to be_falsey
      end

      it 'returns false for discount_price' do
        expect(calculator.calculate[:discount_price]).to be_falsey
      end

      it 'returns an empty string for promotion' do
        expect(calculator.calculate[:promotion]).to eq('')
      end
    end

    context 'when bulk discount rule applies & quantity meets/exceeds minimum' do
      let(:product_rules) do
        [
          instance_double(
            'Bulk Discount Rule',
            rule_type: 'coffee_discount',
            rule_minimum_quantity: 2,
            rule_parameter: 0.5,
            description: 'Bulk Discount Applied'
          )
        ]
      end

      it 'returns the correct subtotal with bulk discount' do
        expect(calculator.calculate[:subtotal]).to eq(47.5)
      end

      it 'returns false for two_plus_one' do
        expect(calculator.calculate[:two_plus_one]).to be_falsey
      end

      it 'returns true for discount_price' do
        expect(calculator.calculate[:discount_price]).to be_truthy
      end

      it 'returns the promotion description' do
        expect(calculator.calculate[:promotion]).to eq('Bulk Discount Applied')
      end
    end

    context 'when coffee discount rule applies & quantity meets/exceeds minimum' do
      let(:product_rules) do
        [
          instance_double(
            'Coffee Discount Rule',
            rule_type: 'coffee_discount',
            rule_minimum_quantity: 2,
            rule_parameter: 0.5,
            description: 'Coffee Discount Applied'
          )
        ]
      end

      it 'returns the correct subtotal with coffee discount' do
        expect(calculator.calculate[:subtotal]).to eq(47.5)
      end

      it 'returns false for two_plus_one' do
        expect(calculator.calculate[:two_plus_one]).to be_falsey
      end

      it 'returns true for discount_price' do
        expect(calculator.calculate[:discount_price]).to be_truthy
      end

      it 'returns the promotion description' do
        expect(calculator.calculate[:promotion]).to eq('Coffee Discount Applied')
      end
    end
  end

  describe '#discount_price?' do
    let(:bulk_discount_rule) do
      instance_double('ProductRule', rule_type: 'bulk_discount', rule_minimum_quantity: 3)
    end
    let(:coffee_discount_rule) do
      instance_double('ProductRule', rule_type: 'coffee_discount', rule_minimum_quantity: 2)
    end

    context 'when bulk discount rule applies & quantity meets/exceeds minimum' do
      it 'returns true' do
        expect(calculator.send(:discount_price?, bulk_discount_rule, 3)).to be_truthy
      end
    end

    context 'when coffee discount rule applies & quantity meets/exceeds minimum' do
      it 'returns true' do
        expect(calculator.send(:discount_price?, coffee_discount_rule, 2)).to be_truthy
      end
    end

    context 'when rule type is neither bulk discount nor coffee discount' do
      let(:rule) do
        instance_double('ProductRule', rule_type: 'some_other_rule', rule_minimum_quantity: 3)
      end

      it 'returns false' do
        expect(calculator.send(:discount_price?, rule, 3)).to be_falsey
      end
    end
  end
end
