module Api
  module V1
    class CartController < ApplicationController
      def subtotal
        result = interactor.calculate

        if result
          render json: result, status: 201
        else
          render json: { errors: interactor.errors.details }, status: 422
        end
      end

      private

      def interactor
        Cart::SubtotalCalculator.new(company_id, param_id, param_quantity)
      end

      def param_id
        params[:id]
      end

      def param_quantity
        params[:quantity].to_i
      end

      def company_id
        @company_id || 1
      end
    end
  end
end
