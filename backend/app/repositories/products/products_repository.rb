module Products
  class ProductsRepository < SqliteRepository
    def entity
      Product
    end

    def entities
      entity.all.includes(:product_rules)
    end
  end
end
