module Products
    module Interactors
        class Delete
            def initialize(id)
                @id = id
            end

            def call
              entity = boundary.find_by_id(id)

              return nil unless entity

              repository.delete(id, params)
            end

            private

            attr_reader :id

            def repository
              ProductsRepository.new
            end
          
            def boundary
              ProductsBoundary.new
            end
        end
    end
end
