class CartsController < ApplicationController

  #testing purposes
  skip_before_action :verify_authenticity_token, only: [:subtotal]

  def subtotal
    item = params[:id]
    quantity = params[:quantity].to_i

    subtotal = repository.calculate_subtotal(item, quantity)

    render json: { subtotal: subtotal }
  end

  private

  def repository
    CartsRepository.new
  end
end
