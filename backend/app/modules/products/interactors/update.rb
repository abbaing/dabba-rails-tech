module Products
    module Interactors
        class Update
            def initialize(id, params)
                @id = id
                @params = params
                @errors = []
            end

            def call
              entity = boundary.find_by_id(id)

              if entity
                if repository.update(id, params)
                  entity
                else
                  @errors = entity.errors.details
                  nil
                end
              else
                @errors = [{ id: [{ error: 'not found' }] }]
                nil
              end
            end

            private

            attr_reader :id
            attr_reader :params
            attr_reader :errors

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
