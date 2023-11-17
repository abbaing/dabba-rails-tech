require "rails_helper"

RSpec.describe SubtotalCalculator do
  describe "#calculate" do
    let(:product) { instance_double(Product, price: 10, discount_quantity: 2, discount_price: 8) }
    let(:quantity) { 3 }

    subject { described_class.new(product, quantity) }

    context "when discount is applicable" do
      it "applies the discount" do
        allow(product).to receive(:discount_quantity).and_return(2)
        allow(product).to receive(:discount_price).and_return(8)

        subtotal = subject.calculate

        expect(subtotal).to eq(24)
      end
    end

    context "when buy one get one free is applicable" do
      it "applies buy one get one free" do
        allow(product).to receive(:discount_quantity).and_return(2)
        allow(product).to receive(:discount_price).and_return(nil)

        subtotal = subject.calculate

        expect(subtotal).to eq(20)
      end
    end

    context "when no discount is applicable" do
      it "calculates the subtotal without a discount" do
        allow(product).to receive(:discount_quantity).and_return(nil)
        allow(product).to receive(:discount_price).and_return(nil)

        subtotal = subject.calculate

        expect(subtotal).to eq(30)
      end
    end
  end
end
