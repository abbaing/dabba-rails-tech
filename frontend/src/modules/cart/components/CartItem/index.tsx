import CartModel from 'models/cartModel'
import React, { useEffect, useState } from 'react'
import cartService from 'services/CartService'
import cartStore from 'stores/cartStore'
import { formatCurrency } from 'utils/currencyUtils'
import styles from './index.module.css'
import { toast } from 'react-toastify'

interface Props {
  item: CartModel
}

const CartItem = ({ item }: Props) => {
  const [count, setCount] = useState(item.quantity)
  const [subtotal, setSubtotal] = useState<number>()

  useEffect(() => {
    const fetchOptions = async (): Promise<void> => {
      try {
        const subtotalResponse = await cartService.calculateSubtotal(
          item.product,
          count
        )
        setSubtotal(subtotalResponse as number)
      } catch (error) {
        toast.error('There was a problem retrieving the data.')
      }
    }

    void fetchOptions()
  }, [count])

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

  const priceComponent = () => {
    const hasPromotionPrice = product.promotionPrice
    const hasPromotionQuantity = product.promotionQuantity
    const applyPromotion = count === product.promotionQuantity

    if (hasPromotionQuantity && applyPromotion && hasPromotionPrice) {
      return (
        <small className='text-body-secondary'>
          <span className='old-price'>{formatCurrency(product.price)}</span>
          <span className='price'>
            {' '}
            {formatCurrency(product.promotionPrice)}
          </span>
        </small>
      )
    }
    if (hasPromotionQuantity && applyPromotion) {
      return (
        <small className='text-body-secondary'>
          <span className='price'> {formatCurrency(product.price)}</span>
          <span className='price-badge badge text-bg-warning'>2X1</span>
        </small>
      )
    } else {
      return (
        <small className='text-body-secondary'>
          <span className='price'> {formatCurrency(product.price)}</span>
        </small>
      )
    }
  }

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
      <div className='col-md-2 px-3 my-3 text-center'>
        <div className={styles['column-label']}>Price</div>
        <span className='text-xl font-weight-medium'>{priceComponent()}</span>
      </div>
      <div className='col-md-auto px-3 my-3 text-center'>
        <div className={styles['column-label']}>Subtotal</div>
        <span className='text-xl font-weight-medium'>
          <small className='text-body-secondary'>
            <span className='price'> {formatCurrency(subtotal)}</span>
          </small>
        </span>
      </div>
    </div>
  )
}

export default CartItem
