require 'rails_helper'

RSpec.describe Cart::SubtotalCalculator do
  let(:company_id) { 1 }
  let(:product) { double('Product', id: 123, price: 10, discount_quantity: nil, discount_price: nil) }
  let(:product_id) { product.id }
  let(:boundary) { instance_double('Products::ProductsBoundary') }
  subject { described_class.new(company_id, product_id, quantity) }

  before do
    allow(Products::ProductsBoundary).to receive(:new).with(company_id).and_return(boundary)
    allow(boundary).to receive(:find_by_id).with(id: product_id).and_return(product)
  end

  context "with quantity discount" do
    let(:quantity) { 3 }

    before do
      allow(product).to receive(:discount_quantity).and_return(2)
      allow(product).to receive(:discount_price).and_return(8)
    end

    it "calculates subtotal with quantity discount" do
      expect(subject.calculate).to eq(24)
    end
  end

  context "with price discount" do
    let(:quantity) { 3 }

    before do
      allow(product).to receive(:discount_quantity).and_return(quantity)
      allow(product).to receive(:discount_price).and_return(5)
    end

    it "calculates subtotal with price discount" do
      expect(subject.calculate).to eq(15)
    end
  end

  context "with buy one get one free promotion" do
    let(:quantity) { 4 }

    before do
      allow(product).to receive(:discount_quantity).and_return(2)
    end

    it "calculates subtotal with buy one get one free promotion" do
      expect(subject.calculate).to eq(20)
    end
  end

  context "with no discounts" do
    let(:quantity) { 1 }

    it "calculates subtotal without discounts" do
      expect(subject.calculate).to eq(product.price)
    end
  end

  context "with product not found" do
    let(:product_id) { 0 }
    let(:quantity) { 1 }

    before do
      allow(boundary).to receive(:find_by_id).with(id: product_id).and_return(nil)
    end

    it "returns 0 as subtotal" do
      expect(subject.calculate).to eq(0)
    end
  end

  context "with invalid product data" do
    let(:quantity) { 1 }

    before do
      allow(product).to receive(:discount_quantity).and_return(0)
      allow(product).to receive(:discount_price).and_return(nil)
    end

    it "calculates subtotal without discounts" do
      expect(subject.calculate).to eq(product.price)
    end
  end
end
