class CreateProductRules < ActiveRecord::Migration[7.1]
  def change
    create_table :product_rules do |t|
      t.integer :product_id
      t.string :rule_type
      t.decimal :rule_parameter
      t.integer :rule_minimum_quantity
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
