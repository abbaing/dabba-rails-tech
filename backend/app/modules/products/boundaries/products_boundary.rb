class ProductsBoundary
  def find_all
    Product.all
  end

  def find_by_id(product_id)
    Product.find_by(id: product_id)
  end
end
