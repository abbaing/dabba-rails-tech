module Api
  module V1
    module Products
      class ProductsController < ApplicationController

        def index
          @entities = boundary.find_all
          render json: entities
        end
      
        def show
          @entity = boundary.find_by_id(params[:id])
          render json: @entity
        end
      
        def create
          @product = create_interactor.call(product_params)
          render json: @product, status: :created
        end
      
        def update
          @product = update_interactor.call(params[:id], product_params)
          render json: @product
        end
      
        def destroy
          delete_interactor.call(params[:id])
          head :no_content
        end
      
        private

        def product_params
          params.require(:product).permit(:product_code, :name, :price)
        end
      
        def boundary
          Products::Boundaries::ProductsBoundary.new
        end
      
        def create_interactor
          ProductInteractors::Create.new
        end
      
        def update_interactor
          ProductInteractors::Update.new
        end
      
        def delete_interactor
          ProductInteractors::Delete.new
        end
      
        def repository
          ProductsRepository.new
        end
      end
    end
  end      
end
