require "rails_helper"

RSpec.describe CartsRepository do
  describe "#calculate_subtotal" do
    let(:products_boundary) { instance_double(ProductsBoundary) }
    let(:product_id) { 1 }
    let(:quantity) { 3 }
    let(:product) { instance_double(Product, id: product_id, price: 10, discount_quantity: 2, discount_price: 8) }

    subject { described_class.new }

    before do
      allow(subject).to receive(:products_boundary).and_return(products_boundary)
      allow(products_boundary).to receive(:find_by_id).with(product_id).and_return(product)
    end

    context "when product is found" do
      it "calculates the subtotal" do
        subtotal_calculator = instance_double(SubtotalCalculator, calculate: 24)
        allow(SubtotalCalculator).to receive(:new).with(product, quantity).and_return(subtotal_calculator)

        subtotal = subject.calculate_subtotal(product_id, quantity)

        expect(subtotal).to eq(24)
      end
    end

    context "when product is not found" do
      it "returns zero" do
        allow(products_boundary).to receive(:find_by_id).with(product_id).and_return(nil)

        subtotal = subject.calculate_subtotal(product_id, quantity)

        expect(subtotal).to eq(0)
      end
    end
  end
end
