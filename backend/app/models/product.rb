class Product < ApplicationRecord
  has_many :purchase_details
  has_many :product_rules

  def rule_descriptions
    product_rules.map { |rule| "- #{rule.description}" }.join("\n")
  end
end
