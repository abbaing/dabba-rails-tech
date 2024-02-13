require 'rails_helper'

RSpec.describe Products::ReadOne do
  let(:company_id) { 1 }
  let(:product_id) { 1 }
  let(:boundary) { instance_double('Products::ProductsBoundary') }
  let(:product) { instance_double('Product') }
  let(:product_presenter) { instance_double('Products::ProductPresenter', as_json: serialized_product) }
  let(:serialized_product) { { id: product_id, name: 'Example Product' } }
  
  subject { described_class.new(company_id, product_id) }
  
  before do
    allow(Products::ProductsBoundary).to receive(:new).with(company_id).and_return(boundary)
    allow(boundary).to receive(:find_by_id).with(id: product_id).and_return(product)
    allow(Products::ProductPresenter).to receive(:new).with(product).and_return(product_presenter)
  end
  
  describe '#call' do
    context 'when the product exists' do
    it 'returns the serialized product' do
      expect(subject.call).to eq(serialized_product)
    end
    end
  
    context 'when the product does not exist' do
    let(:product) { nil }
  
    it 'returns nil' do
      expect(subject.call).to be_nil
    end
    end
  end
end
