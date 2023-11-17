RSpec.describe ProductsBoundary do
  let(:products_boundary) { ProductsBoundary.new }

  describe "#find_all" do
    it "returns all products" do
      products = double("products")
      allow(Product).to receive(:all).and_return(products)

      expect(products_boundary.find_all).to eq(products)
    end
  end

  describe "#find_by_id" do
    let(:product_id) { 1 }

    context "when product with given id exists" do
      it "returns the product" do
        product = double("product")
        allow(Product).to receive(:find_by).with(id: product_id).and_return(product)

        expect(products_boundary.find_by_id(product_id)).to eq(product)
      end
    end

    context "when product with given id does not exist" do
      it "returns nil" do
        allow(Product).to receive(:find_by).with(id: product_id).and_return(nil)

        expect(products_boundary.find_by_id(product_id)).to be_nil
      end
    end
  end
end
