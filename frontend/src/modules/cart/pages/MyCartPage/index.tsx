import Layout from 'layout'
import CartItem from 'modules/cart/components/CartItem/index'
import React from 'react'
import cartStore from 'stores/cartStore'
import './index.css'

const MyCartPage = (): JSX.Element => {
  return (
    <Layout>
      <h1 className="display-5 pb-3 mb-3 border-bottom">My cart</h1>
      <div className='container my-cart-container'>
        <div className='row'>
          {cartStore.items.map((item) => (
            <CartItem key={item.product.id} item={item} />
          ))}
        </div>
      </div>
    </Layout>
  )
}

export default MyCartPage
