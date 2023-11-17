RSpec.describe ProductsRepository do
  let(:repository) { ProductsRepository.new }

  describe "#read_all" do
    let(:products_boundary_double) { double("ProductsBoundary") }
    let(:product1) { double("Product1") }
    let(:product2) { double("Product2") }

    before do
      allow(repository).to receive(:boundary).and_return(products_boundary_double)
      allow(products_boundary_double).to receive(:find_all).and_return([product1, product2])
      allow(repository).to receive(:serialize).with(product1).and_return({ id: 1, name: "Product 1" })
      allow(repository).to receive(:serialize).with(product2).and_return({ id: 2, name: "Product 2" })
    end

    it "returns an array of serialized products" do
      expected_result = [
        { id: 1, name: "Product 1" },
        { id: 2, name: "Product 2" },
      ]

      expect(repository.read_all).to eq(expected_result)
    end
  end
end
