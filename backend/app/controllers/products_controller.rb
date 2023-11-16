class ProductsController < ApplicationController
  def index
    products = repository.read_all
    render json: products, status: :ok
  end

  private

  def repository
    ProductsRepository.new
  end
end