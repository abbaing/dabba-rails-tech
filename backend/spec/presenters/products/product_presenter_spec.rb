require 'rails_helper'

RSpec.describe Products::ProductPresenter do
  let(:product) do
    double(
      "Product",
      id: 1,
      code: "P001",
      name: "My product",
      price: 20.0,
    )
  end

  let(:product_presenter) { described_class.new(product) }

  describe "#as_json" do
    it "returns the product attributes as a JSON hash" do
      expected_json = {
        id: 1,
        code: "P001",
        name: "My product",
        price: 20.0,
      }

      expect(product_presenter.as_json).to eq(expected_json)
    end
  end
end
