class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.date :purchase_date
      t.decimal :total_price

      t.timestamps
    end
  end
end
