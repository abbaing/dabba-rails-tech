module Products
    module Interactors
        class Update
            def initialize(id, params)
                @id = id
                @params = params
            end

            def call
              entity = boundary.find_by_id(id)

              return nil unless entity

              entity = repository.update(id, params)

              return nil unless entity
          
              serialize(entity)
            end

            private

            attr_reader :id
            attr_reader :params

            def serialize(product)
              ProductPresenter.new(product).as_json
            end

            def repository
              ProductsRepository.new
            end
          
            def boundary
              ProductsBoundary.new
            end
        end
    end
end
