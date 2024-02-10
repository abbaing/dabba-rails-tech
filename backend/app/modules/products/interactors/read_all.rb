module Products
    module Interactors
        class ReadAll
            def call
              entities = boundary.find_all
          
              result = entities.map do |entity|
                serialize(entity)
              end
          
              result
            end
          
            private
          
            def serialize(product)
              ProductPresenter.new(product).as_json
            end
          
            def boundary
              ProductsBoundary.new
            end
        end
    end
end
  