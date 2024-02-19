module Products
  class ReadOne
    def initialize(company_id, id)
      @company_id = company_id
      @id = id
    end

    def call
      entity = boundary.find_by_id(id:)

      return nil unless entity

      serialize(entity)
    end

    private

    attr_reader :id, :company_id

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
