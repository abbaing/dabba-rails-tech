module Products
    module Interactors
        class Create
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
            attr_reader :errors

            def serialize(product)
              ProductPresenter.new(product).as_json
            end

            def repository
              ProductsRepository.new
            end
        end
    end
end
