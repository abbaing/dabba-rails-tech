import Layout from 'layout'
import ProductModel from 'models/productModel'
import ProductItem from 'modules/product-list/components/ProductItem'
import React from 'react'
import './index.css'
import cartStore from 'stores/cartStore'

const products: ProductModel[] = [
  {
    id: 1,
    name: 'Product 1',
    code: 'C01',
    price: 12.12,
    promotionMessage: 'Buy one, get one free',
  },
  {
    id: 2,
    name: 'Product 2',
    code: 'C02',
    price: 30,
    promotionMessage: 'Price drops to €4.50 for 3 or more strawberries!',
  },
  {
    id: 3,
    name: 'Product 3',
    code: 'C03',
    price: 10.11,
    oldPrice: 12.15,
    promotionMessage:
      'Price drops to 2/3 of the original price for 3 or more coffees!',
  },
]

const ProductListPage = (): JSX.Element => {
  const onAddToCart = (item: ProductModel) => {
    cartStore.addItem(item)
  }

  return (
    <Layout>
      <h3>Product Catalog</h3>
      <div className='container product-catalog-container'>
        <div className='row row-cols-md-3 g-4'>
          {products.map((item) => (
            <ProductItem key={item.id} item={item} onAddToCart={onAddToCart} />
          ))}
        </div>
      </div>
    </Layout>
  )
}

export default ProductListPage
