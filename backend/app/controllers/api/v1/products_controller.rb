module Api
  module V1
    class ProductsController < ApplicationController

      def index
        @result = ::Products::ReadAll.new(company_id).call

        if @result
          render json: { data: @result }
        else
          render json: {}, status: 200
        end
      end
    
      def show
        @result = ::Products::ReadOne.new(company_id, id).call

        if @result
          render json: { data: @result }
        else
          render json: {}, status: 200
        end
      end
    
      def create
        result = create_interactor.call

        if result
          render json: { data: result }, status: 201
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
        params.require(:product).permit(:code, :name, :price)
      end

      def company_id
        @company_id || 1
      end

      def id
        params[:id]
      end

      def create_interactor
        ::Products::Create.new(company_id, product_params)
      end
    end
  end      
end
