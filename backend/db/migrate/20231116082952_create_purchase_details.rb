class CreatePurchaseDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_details do |t|
      t.integer :purchase_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
