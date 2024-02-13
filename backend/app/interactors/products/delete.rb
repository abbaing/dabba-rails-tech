module Products
  class Delete
    attr_reader :errors
    
    def initialize(company_id, id)
      @company_id = company_id
      @id = id
      @errors = []
    end

    def call
      entity = boundary.find_by_id(id: id)
    
      if entity
        if repository.destroy(id)
          entity
        else
          if entity.errors.is_a?(ActiveModel::Errors)
            @errors = entity.errors.details
          else
            @errors = [{ error: 'Delete failed' }]
          end
          nil
        end
      else
        @errors = [{ id: [{ error: 'not found' }] }]
        nil
      end
    end

    private

    attr_reader :id
    attr_reader :company_id

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def repository
      Products::ProductsRepository.new(nil)
    end

    def boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
