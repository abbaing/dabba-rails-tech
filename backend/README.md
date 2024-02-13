
Models
- rails generate model Product code:string name:string price:decimal
- rails generate model Purchase purchase_date:date total_price:decimal
- rails generate model PurchaseDetail purchase_id:integer product_id:integer quantity:integer
- rails generate model ProductRule product_id:integer rule_type:string rule_parameter:decimal description:string

Migrations
- bin/rails db:migrate
- bin/rails db:seed
