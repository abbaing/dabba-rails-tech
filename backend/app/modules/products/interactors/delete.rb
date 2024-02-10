module Products
    module Interactors
        class Delete
            def initialize(id)
                @id = id
                @errors = []
            end

            def call
              entity = boundary.find_by_id(id)

              if entity
                repository.delete(id, params)  
                true
              else
                @errors = [{ id: [{ error: 'not found' }] }]
                false
              end
            end

            private

            attr_reader :id
            attr_reader :errors

            def repository
              ProductsRepository.new
            end
          
            def boundary
              ProductsBoundary.new
            end
        end
    end
end
