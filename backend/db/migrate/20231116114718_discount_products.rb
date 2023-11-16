class DiscountProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :discount_quantity, :integer
    add_column :products, :discount_price, :decimal
    add_column :products, :discount_description, :string
  end
end
