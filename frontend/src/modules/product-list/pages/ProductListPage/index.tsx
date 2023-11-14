import React, { useState } from 'react'
import Layout from 'layout'
import ProductItem from '../../components/ProductItem'
import './index.css'

const products = [
  { name: 'Product 1', code: 'C01', price: 12.12, promotionMessage: 'Buy one, get one free' },
  { name: 'Product 2', code: 'C02', price: 30, promotionMessage: 'Price drops to €4.50 for 3 or more strawberries!' },
  { name: 'Product 3', code: 'C03', price: 10.11, oldPrice: 12.15, promotionMessage: 'Price drops to 2/3 of the original price for 3 or more coffees!' },
]

const ProductListPage = (): JSX.Element => {
  return (
    <Layout>
      <h3>Product Catalog</h3>
      <div className='container product-catalog-container'>
      <div className="row row-cols-md-3 g-4">
          {products.map((item) => (
            <ProductItem name={item.name} code={item.code} price={item.price} oldPrice={item.oldPrice} promotionMessage={item.promotionMessage} />
          ))}
        </div>
      </div>
    </Layout>
  )
}

export default ProductListPage
