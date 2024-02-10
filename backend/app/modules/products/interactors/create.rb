module Products
    module Interactors
        class Create
            def initialize(params)
                @params = params
            end

            def call
              entity = repository.create(params)

              return nil unless entity
          
              serialize(entity)
            end

            private

            attr_reader :params

            def serialize(product)
              ProductPresenter.new(product).as_json
            end

            def repository
              ProductsRepository.new
            end
        end
    end
end
