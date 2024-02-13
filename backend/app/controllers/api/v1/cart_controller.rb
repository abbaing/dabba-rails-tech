module Api
  module V1
    class CartController < ApplicationController

      #testing purposes
      skip_before_action :verify_authenticity_token, only: [:subtotal]

      def subtotal
        @result = interactor.calculate

        if @product
          render json: { data: @result }, status: 201
        else
          render json: { errors: create_interactor.errors.details }, status: 422
        end
      end

      private

      def interactor
        Cart::Interactors::SubtotalCalculator.new(
          product_id: params[:id]
          quantity: params[:quantity].to_i
        )
      end
    end
  end      
end
