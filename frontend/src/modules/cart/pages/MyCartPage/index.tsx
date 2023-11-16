import Layout from 'layout'
import { observer } from 'mobx-react-lite'
import CartItem from 'modules/cart/components/CartItem/index'
import React from 'react'
import cartStore from 'stores/cartStore'
import './index.css'
import { toast } from 'react-toastify'

const MyCartPage = observer((): JSX.Element => {
  const handleCheckout = () => {
    toast.info('Coming Soon :)')
  }

  return (
    <Layout>
      <h1 className='display-5 pb-3 mb-3 border-bottom'>My cart</h1>
      <div className='container my-cart-container'>
        <div className='row'>
          {cartStore.items.map((item) => (
            <CartItem key={item.product.id} item={item} />
          ))}
        </div>
        <div className='row'>
          <div className='col-md-6'>
            <button className='btn btn-primary' onClick={handleCheckout}>
              Checkout
            </button>
          </div>
        </div>
      </div>
    </Layout>
  )
})

export default MyCartPage
