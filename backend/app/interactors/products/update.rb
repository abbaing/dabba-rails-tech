module Products
  class Update
    attr_reader :errors
    
    def initialize(company_id, id, params)
      @company_id = company_id
      @id = id
      @params = params
      @errors = []
    end

    def call
      entity = boundary.find_by_id(id: id)
    
      if entity
        if entity.update(params)
          entity
        else
          if entity.errors.is_a?(ActiveModel::Errors)
            @errors = entity.errors.details
          else
            @errors = [{ error: 'Update failed' }]
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
    attr_reader :params

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def boundary
      Products::ProductsBoundary.new(company_id)
    end
  end
end
