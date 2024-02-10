module Products
    module Interactors
        class ReadOne
            def initialize(id)
                @id = id
            end

            def call
              entity = boundary.find_by_id(id)

              return nil unless entity
          
              serialize(entity)
            end

            private

            attr_reader :id

            def serialize(product)
              ProductPresenter.new(product).as_json
            end
          
            def boundary
              ProductsBoundary.new
            end
        end
    end
end
  