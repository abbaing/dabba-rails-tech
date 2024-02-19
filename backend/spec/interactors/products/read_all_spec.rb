require 'rails_helper'

RSpec.describe Products::ReadAll do
  subject(:read_all_products) { described_class.new(company_id) }

  let(:company_id) { 1 }
  let(:boundary) { instance_double('Products::ProductsBoundary') }
  let(:product1) { instance_double('Product', id: 1, name: 'Product 1') }
  let(:product2) { instance_double('Product', id: 2, name: 'Product 2') }
  let(:product_presenter) { instance_double('Products::ProductPresenter') }
  let(:serialized_product1) { { id: 1, name: 'Product 1' } }
  let(:serialized_product2) { { id: 2, name: 'Product 2' } }

  before do
    allow(Products::ProductsBoundary).to receive(:new).with(company_id).and_return(boundary)
    allow(boundary).to receive(:find_all).and_return([product1, product2])
    allow(Products::ProductPresenter).to receive(:new).with(product1).and_return(product_presenter)
    allow(Products::ProductPresenter).to receive(:new).with(product2).and_return(product_presenter)
    allow(product_presenter).to receive(:as_json).and_return(
      serialized_product1,
      serialized_product2
    )
  end

  describe '#call' do
    it 'returns an array of serialized products' do
      expect(read_all_products.call).to match_array([serialized_product1, serialized_product2])
    end
  end
end
