import CartModel from 'models/cartModel'
import React, { useState } from 'react'
import cartService from 'services/CartService'
import { formatCurrency } from 'utils/currencyUtils'
import styles from './index.module.css'
import cartStore from 'stores/cartStore'

interface Props {
  item: CartModel
}

const CartItem = ({ item }: Props) => {
  const [count, setCount] = useState(item.quantity)

  const oldPriceComponent = (price?: number) => {
    return <span className={styles['old-price']}>{formatCurrency(price)}</span>
  }

  const handleIncrement = () => {
    let newCount = count + 1
    setCount(newCount)
    cartService.updateCart(product, newCount)
  }

  const handleDecrement = () => {
    let newCount = count - 1
    if (newCount > 0) {
      setCount(newCount)
      cartService.updateCart(product, newCount)
    }
  }

  const onRemove = () => {
    cartStore.removeItem(item.product.id)
  }

  const product = item.product

  return (
    <div
      className={`${styles.container} cart-item d-md-flex justify-content-between`}
    >
      <div className='col-md-auto px-3 my-3'>
        <button className='btn btn-sm btn-outline-secondary' onClick={onRemove}>
          Remove
        </button>
      </div>
      <div className='col-md-5 px-3 my-3'>
        <h4>{product.name}</h4>
        <span className={`${styles['column-label']}`}>
          <strong>Code:</strong> {product.code}
        </span>
      </div>
      <div className='col-md-auto px-3 my-3 text-center'>
        <div className={styles['column-label']}>Quantity</div>
        <div className={styles['count-input']}>
          <div>
            <button
              className='btn btn-outline-secondary'
              onClick={handleDecrement}
            >
              -
            </button>
            <span className={styles['cart-counter']}>{count}</span>
            <button
              className='btn btn-outline-secondary'
              onClick={handleIncrement}
            >
              +
            </button>
          </div>
        </div>
      </div>
      <div className='col-md-auto px-3 my-3 text-center'>
        <div className={styles['column-label']}>Price</div>
        <span className='text-xl font-weight-medium'>
          {product.oldPrice && oldPriceComponent(product.oldPrice)}
          <span>{formatCurrency(product.price)}</span>
        </span>
      </div>
      <div className='col-md-auto px-3 my-3 text-center'>
        <div className={styles['column-label']}>Subtotal</div>
        <span className='text-xl font-weight-medium'>$35.00</span>
      </div>
    </div>
  )
}

export default CartItem
