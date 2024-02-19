# Products
Product.create(code: 'GR1', name: 'Green Tea', price: 3.11, active: true, company_id: 1)
Product.create(code: 'SR1', name: 'Strawberries', price: 5.00, active: true, company_id: 1)
Product.create(code: 'CF1', name: 'Coffee', price: 11.23, active: true, company_id: 1)

# Purchases
purchase1 = Purchase.create(purchase_date: '2023-11-07', total_price: 3.11)
purchase2 = Purchase.create(purchase_date: '2023-11-07', total_price: 16.61)
purchase3 = Purchase.create(purchase_date: '2023-11-07', total_price: 30.57)

# PurchaseDetails
PurchaseDetail.create(purchase: purchase1, product: Product.find_by(code: 'GR1'), quantity: 2)
PurchaseDetail.create(purchase: purchase2, product: Product.find_by(code: 'SR1'), quantity: 2)
PurchaseDetail.create(purchase: purchase2, product: Product.find_by(code: 'GR1'), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(code: 'GR1'), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(code: 'CF1'), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(code: 'SR1'), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(code: 'CF1'), quantity: 2)

# Green Tea (GR1) - Buy One Get One Free
ProductRule.create!(
  product: Product.find_by(code: 'GR1'),
  rule_type: 'buy_one_get_one_free',
  rule_minimum_quantity: 2,
  description: 'Buy one get one free offer'
)

# Strawberries (SR1) - Bulk Discount
ProductRule.create!(
  product: Product.find_by(code: 'SR1'),
  rule_type: 'bulk_discount',
  rule_parameter: 4.50, # discounted price
  rule_minimum_quantity: 3,
  description: 'Bulk discount for 3 or more strawberries'
)

# Coffee (CF1) - Coffee Addict Discount
ProductRule.create!(
  product: Product.find_by(code: 'CF1'),
  rule_type: 'coffee_discount',
  rule_parameter: 2 / 3.0, # discounted price ratio
  rule_minimum_quantity: 3,
  description: 'Discount for buying 3 or more coffees'
)
