import Layout from 'layout'
import CartItem from 'modules/cart/components/CartItem/index'
import React from 'react'
import cartStore from 'stores/cartStore'
import './index.css'

const MyCartPage = (): JSX.Element => {
  return (
    <Layout>
      <h3>Product Catalog</h3>
      <div className='container my-cart-container'>
        <div className='row row-cols-md-3 g-4'>
          {cartStore.items.map((item) => (
            <CartItem key={item.product.id} item={item} />
          ))}
        </div>
      </div>
    </Layout>
  )
}

export default MyCartPage
