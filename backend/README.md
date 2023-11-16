
Models

Commands used to build the domain model
- rails generate model Product product_code:string name:string price:decimal
- rails generate model Purchase purchase_date:date total_price:decimal
- rails generate model PurchaseDetail purchase_id:integer product_id:integer quantity:integer

Migrations
- bin/rails db:migrate 
- bin/rails db:seed
