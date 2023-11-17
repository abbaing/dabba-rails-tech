RSpec.describe ProductPresenter do
  let(:product) do
    double(
      "Product",
      id: 1,
      product_code: "P001",
      name: "My product",
      price: 20.0,
      discount_price: 15.0,
      discount_description: "Special Offer",
      discount_quantity: 2,
    )
  end

  let(:product_presenter) { ProductPresenter.new(product) }

  describe "#as_json" do
    it "returns the product attributes as a JSON hash" do
      expected_json = {
        id: 1,
        code: "P002",
        name: "My product 02",
        price: 20.0,
        promotionPrice: 15.0,
        promotionMessage: "Another discount",
        promotionQuantity: 2,
      }

      expect(product_presenter.as_json).to eq(expected_json)
    end
  end
end
