module Products
  class ReadAll
    def initialize(company_id)
      @company_id = company_id
    end

    def call
      entities = boundary.find_all

      entities.map do |entity|
        serialize(entity)
      end
    end

    private

    attr_reader :company_id

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
