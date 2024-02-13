require 'rails_helper'

RSpec.describe Products::ProductsBoundary, type: :boundary do
  let(:company_id) { 1 }
  let(:products_boundary) { described_class.new(company_id) }

  describe "#find_all" do
    it "returns all products" do
      products = [double('Product'), double('Product')]
      allow(Product).to receive(:all).and_return(products)

      expect(products_boundary.find_all).to eq(products)
    end
  end

  describe "#find_by_id" do
    it 'returns the product with the specified id' do
      product = double('Product', id: 123)
      products = [product]
      allow(Product).to receive(:all).and_return(products)
      allow(products).to receive(:find).with(123).and_return(product)

      expect(products_boundary.find_by_id(id: 123)).to eq(product)
    end
  end
end
