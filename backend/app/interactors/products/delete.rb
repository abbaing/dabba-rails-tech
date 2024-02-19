module Products
  class Delete
    attr_reader :errors

    def initialize(company_id, id)
      @company_id = company_id
      @id = id
      @errors = []
    end

    def call
      entity = boundary.find_by_id(id:)

      if entity
        if entity.destroy
          entity
        else
          @errors = if entity.errors.is_a?(ActiveModel::Errors)
                      entity.errors.details
                    else
                      [{ error: 'Delete failed' }]
                    end
          nil
        end
      else
        @errors = [{ id: [{ error: 'not found' }] }]
        nil
      end
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
