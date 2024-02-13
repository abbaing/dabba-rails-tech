module Products
  class Create
    attr_reader :errors
    
    def initialize(params)
      @params = params
      @errors = []
    end

    def call
      entity = repository.new(params)
      if entity.save
        serialize(entity)
      else
        @errors = entity.errors.details
        nil
      end
    end

    private

    attr_reader :params

    def serialize(product)
      Products::ProductPresenter.new(product).as_json
    end

    def repository
      Products::ProductsRepository.new(nil)
    end
  end
end
