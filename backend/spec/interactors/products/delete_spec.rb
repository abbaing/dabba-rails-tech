require 'rails_helper'

RSpec.describe Products::Delete do
  subject(:product_deleter) { described_class.new(company_id, product_id) }

  let(:company_id) { 1 }
  let(:product_id) { 1 }
  let(:product) { instance_double('Product', id: product_id, errors: []) }
  let(:boundary) { instance_double('Products::ProductsBoundary') }

  before do
    allow(boundary).to receive(:find_by_id).with(id: product_id).and_return(product)
    allow(Products::ProductsBoundary).to receive(:new).with(company_id).and_return(boundary)
  end

  context 'when the product exists' do
    context 'when the deletion is successful' do
      it 'deletes the product' do
        allow(product).to receive(:destroy).and_return(true)
        expect(product_deleter.call).to eq(product)
        expect(product_deleter.errors).to be_empty
      end
    end

    context 'when the deletion fails' do
      it 'sets the errors and returns nil' do
        allow(product).to receive(:destroy).and_return(false)
        expect(product_deleter.call).to be_nil
        expect(product_deleter.errors).to eq([{ error: 'Delete failed' }])
      end
    end
  end

  context 'when the product does not exist' do
    let(:product) { nil }

    it 'sets an error and returns nil' do
      expect(product_deleter.call).to be_nil
      expect(product_deleter.errors).to eq([{ id: [{ error: 'not found' }] }])
    end
  end
end
