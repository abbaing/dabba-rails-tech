# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Products
Product.create(product_code: "GR1", name: "Green Tea", price: 3.11)
Product.create(product_code: "SR1", name: "Strawberries", price: 5.00)
Product.create(product_code: "CF1", name: "Coffee", price: 11.23)

# Purchases
purchase1 = Purchase.create(purchase_date: "2023-11-07", total_price: 3.11)
purchase2 = Purchase.create(purchase_date: "2023-11-07", total_price: 16.61)
purchase3 = Purchase.create(purchase_date: "2023-11-07", total_price: 30.57)

# PurchaseDetails
PurchaseDetail.create(purchase: purchase1, product: Product.find_by(product_code: "GR1"), quantity: 2)
PurchaseDetail.create(purchase: purchase2, product: Product.find_by(product_code: "SR1"), quantity: 2)
PurchaseDetail.create(purchase: purchase2, product: Product.find_by(product_code: "GR1"), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(product_code: "GR1"), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(product_code: "CF1"), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(product_code: "SR1"), quantity: 1)
PurchaseDetail.create(purchase: purchase3, product: Product.find_by(product_code: "CF1"), quantity: 2)
