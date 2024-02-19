require 'rails_helper'

RSpec.describe Products::Create do
  let(:company_id) { 1 }
  let(:params) { { name: 'Test Product', price: 10.99 } }
  let(:subject) { described_class.new(company_id, params) }

  describe '#call' do
    context 'when entity is successfully saved' do
      let(:repository_double) { instance_double('Products::ProductsRepository') }
      let(:product_double) { instance_double('Product', save: true) }

      before do
        allow(Products::ProductsRepository).to receive(:new).and_return(repository_double)
        allow(repository_double).to receive(:new).with(params).and_return(product_double)
        allow(product_double).to receive(:errors).and_return([])
      end

      it 'returns the serialized product' do
        expect_any_instance_of(Products::ProductPresenter).to receive(:as_json)
        expect(subject.call).to be_nil
      end
    end

    context 'when entity fails to save' do
      let(:repository_double) { instance_double('Products::ProductsRepository') }
      let(:errors) { double(details: { message: 'Error saving product' }) }
      let(:product_double) { instance_double('Product', save: false, errors:) }

      before do
        allow(Products::ProductsRepository).to receive(:new).and_return(repository_double)
        allow(repository_double).to receive(:new).with(params).and_return(product_double)
      end

      it 'returns nil' do
        expect(subject.call).to be_nil
      end

      it 'assigns errors' do
        subject.call
        expect(subject.errors).not_to be_empty
      end
    end
  end
end
