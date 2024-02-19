require 'rails_helper'

RSpec.describe Products::Update do
  subject(:update_product) { described_class.new(company_id, product_id, params) }

  let(:company_id) { 1 }
  let(:product_id) { 1 }
  let(:product) { instance_double('Product', id: product_id, errors: []) }
  let(:params) { { name: 'Updated Product' } }
  let(:boundary) { instance_double('Products::ProductsBoundary') }

  before do
    allow(boundary).to receive(:find_by_id).with(id: product_id).and_return(product)
    allow(Products::ProductsBoundary).to receive(:new).with(company_id).and_return(boundary)
  end

  context 'when the product exists' do
    context 'with successful update' do
      before do
        allow(product).to receive(:update).with(params).and_return(true)
      end

      it 'updates the product' do
        expect(update_product.call).to eq(product)
        expect(update_product.errors).to be_empty
      end
    end

    context 'with failed update' do
      before do
        allow(product).to receive(:update).with(params).and_return(false)
      end

      it 'sets the errors and returns nil' do
        errors = [{ error: 'Update failed' }]
        expect(update_product.call).to be_nil
        expect(update_product.errors).to eq(errors)
      end
    end
  end

  context 'when the product does not exist' do
    let(:product) { nil }

    it 'sets an error and returns nil' do
      expect(update_product.call).to be_nil
      expect(update_product.errors).to eq([{ id: [{ error: 'not found' }] }])
    end
  end
end
