import CartModel from 'models/cartModel'
import React, { useState } from 'react'
import cartService from 'services/CartService'
import { formatCurrency } from 'utils/currencyUtils'
import './index.css'

interface Props {
  item: CartModel
}

const CartItem = ({ item }: Props) => {
  const [count, setCount] = useState(0)

  const oldPriceComponent = (price?: number) => {
    return <span className='old-price'>{formatCurrency(price)}</span>
  }

  const handleIncrement = () => {
    let newCount = count + 1
    setCount(newCount)
    cartService.updateCart(item.product, newCount)
  }

  const handleDecrement = () => {
    let newCount = count - 1
    if (newCount > 0) {
      setCount(newCount)
      cartService.updateCart(item.product, newCount)
    }
  }

  const product = item.product

  return (
    <div className='col'>
      <div className='card mb-3'>
        <div className='row g-0'>
          <div className='col-md-8'>
            <div className='card-body'>
              <h5 className='card-title'>{product.name}</h5>
              <p className='card-text'>Code {product.code}</p>
              <p className='card-text'>
                <small className='text-body-secondary'>
                  {product.oldPrice && oldPriceComponent(product.oldPrice)}
                  <span className='price'>
                    {' '}
                    {formatCurrency(product.price)}
                  </span>
                </small>
              </p>
              <div className='alert alert-primary' role='alert'>
                {product.promotionMessage}
              </div>
            </div>
          </div>
          <div className='col-md-4'>
            <div>
              <button
                className='btn btn-outline-secondary'
                onClick={handleDecrement}
              >
                -
              </button>
              <span className='cart-counter'>{count}</span>
              <button
                className='btn btn-outline-secondary'
                onClick={handleIncrement}
              >
                +
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default CartItem
