require 'rails_helper'

RSpec.describe Products::ProductsRepository, type: :repository do
  let(:product_data) { instance_double('ProductData') }
  let(:products_repository) { described_class.new(product_data) }
  let(:products) { instance_double(ActiveRecord::Relation) }

  before do
    allow(Product).to receive(:all).and_return(products)
    allow(products).to receive(:includes).with(:product_rules).and_return(products)
  end

  describe '#entity' do
    it 'returns the Product class' do
      expect(products_repository.entity).to eq(Product)
    end
  end

  describe '#find_all' do
    it 'returns all products' do
      expect(products_repository.find_all).to eq(products)
    end
  end

  describe '#find_by_id' do
    it 'returns the product with the specified id' do
      product = instance_double(Product, id: 123)
      allow(products).to receive(:find).with(123).and_return(product)

      expect(products_repository.find_by_id(id: 123)).to eq(product)
    end
  end

  describe 'delegated methods' do
    it 'delegates find_or_create_by to the product entity' do
      product_entity = instance_double('ProductEntity')
      allow(products_repository).to receive(:entity).and_return(product_entity)

      params = { name: 'Test Product' }
      expect(product_entity).to receive(:find_or_create_by).with(params)
      products_repository.find_or_create_by(params)
    end

    it 'delegates find_or_initialize_by to the product entity' do
      params = { name: 'Test Product' }
      expect(products_repository).to receive(:find_or_initialize_by).with(params)
      products_repository.find_or_initialize_by(params)
    end

    it 'delegates find_by to the product entity' do
      params = { name: 'Test Product' }
      expect(products_repository).to receive(:find_by).with(params)
      products_repository.find_by(params)
    end

    it 'delegates all to the product entity' do
      expect(products_repository).to receive(:all)
      products_repository.all
    end

    it 'delegates create to the product entity' do
      params = { name: 'Test Product' }
      expect(products_repository).to receive(:create).with(params)
      products_repository.create(params)
    end

    it 'delegates new to the product entity' do
      params = { name: 'Test Product' }
      expect(products_repository).to receive(:new).with(params)
      products_repository.new(params)
    end

    it 'delegates where to the product entity' do
      params = { name: 'Test Product' }
      expect(products_repository).to receive(:where).with(params)
      products_repository.where(params)
    end

    it 'delegates update to the product data' do
      params = { name: 'Test Product' }
      expect(product_data).to receive(:update).with(params)
      products_repository.update(params)
    end

    it 'delegates update! to the product data' do
      params = { name: 'Test Product' }
      expect(product_data).to receive(:update!).with(params)
      products_repository.update!(params)
    end

    it 'delegates save to the product data' do
      expect(product_data).to receive(:save)
      products_repository.save
    end

    it 'delegates save! to the product data' do
      expect(product_data).to receive(:save!)
      products_repository.save!
    end

    it 'delegates destroy to the product data' do
      expect(product_data).to receive(:destroy)
      products_repository.destroy
    end

    it 'delegates destroy! to the product data' do
      expect(product_data).to receive(:destroy!)
      products_repository.destroy!
    end
  end
end
