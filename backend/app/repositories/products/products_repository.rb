module Products
  class ProductsRepository < SqliteRepository
    def entity
      Product
    end
  end
end
