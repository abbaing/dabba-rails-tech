module Products
  class Create
    attr_reader :errors
    
    def initialize(company_id, params)
      @company_id = company_id
      @params = params
      @errors = []
    end

    def call
      params[:company_id] = company_id
      entity = repository.new(params)
      if entity.save
        serialize(entity)
      else
        @errors = entity.errors.details
        nil
      end
    end

    private

    attr_reader :company_id
    attr_reader :params

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def repository
      Products::ProductsRepository.new(nil)
    end
  end
end
