require 'rails_helper'

RSpec.describe Products::ProductsBoundary, type: :boundary do
  let(:company_id) { 1 }
  let(:products_boundary) { described_class.new(company_id) }

  let(:product) { double('Product #1') }
  let(:products) { double('Products') }
  
  before do
    allow(Product).to receive(:all).and_return(products)
    allow(products).to receive(:includes).with(:product_rules).and_return(products)
  end

  describe "#find_all" do
    it "returns all products" do
      expect(products_boundary.find_all).to eq(products)
    end
  end

  describe "#find_by_id" do
    it 'returns the product with the specified id' do
      allow(products).to receive(:find).with(123).and_return(product)

      expect(products_boundary.find_by_id(id: 123)).to eq(product)
    end
  end
end
