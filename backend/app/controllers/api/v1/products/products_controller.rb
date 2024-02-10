module Api
  module V1
    module Products
      class ProductsController < ApplicationController

        def index
          @result = boundary.find_all

          if @result
            render json: { data: @result }
          else
            render json: {}, status: 200
          end
        end
      
        def show
          @result = boundary.find_by_id(params[:id])

          if @result
            render json: { data: @result }
          else
            render json: {}, status: 200
          end
        end
      
        def create
          @result = create_interactor.call(product_params)

          if @product
            render json: { data: @result }, status: 201
          else
            render json: { errors: create_interactor.errors.details }, status: 422
          end
        end
      
        def update
          @result = update_interactor.call(params[:id], product_params)

          if @result
            render json: { data: @result }, status: 201
          else
            render json: { errors: create_interactor.errors.details }, status: 422
          end
        end
      
        def destroy
          @result = delete_interactor.call(params[:id])

          if @result
            head :no_content
          else
            render json: { errors: create_interactor.errors.details }, status: 422
          end
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
