import CartModel from 'models/cartModel'
import React, { useEffect, useState } from 'react'
import { toast } from 'react-toastify'
import cartService from 'services/CartService'
import cartStore from 'stores/cartStore'
import { formatCurrency } from 'utils/currencyUtils'
import styles from './index.module.css'

interface Props {
  item: CartModel
}

const CartItem = ({ item }: Props) => {
  const [count, setCount] = useState(item.quantity)
  const [subtotal, setSubtotal] = useState<number>()
  const [twoPlusOne, setTwoPlusOne] = useState<boolean>()
  const [discountPrice, setDiscountPrice] = useState<boolean>()
  const [promotion, setPromotion] = useState<string>()

  useEffect(() => {
    const fetchOptions = async (): Promise<void> => {
      try {
        const subtotalResponse = await cartService.calculateSubtotal(item.product, count)
        setSubtotal(subtotalResponse.subtotal as number)
        setTwoPlusOne(subtotalResponse.two_plus_one as boolean)
        setDiscountPrice(subtotalResponse.discount_price as boolean)
        setPromotion(subtotalResponse.promotion as string)
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

    toast.info(`${item.product.name} removed from your cart!`)
  }

  const product = item.product

  const priceComponent = () => {
    return (
      <small className="text-body-secondary">
        <span className="price"> {formatCurrency(product.price)}</span>
      </small>
    )
  }

  const subtotalComponent = () => {
    return (
      <small className="text-body-secondary">
        <span className="price"> {formatCurrency(subtotal)}</span>
      </small>
    )
  }

  return (
    <div className={`${styles.container} cart-item d-md-flex justify-content-between`}>
      <div className="col-md-auto px-3 my-3">
        <button className="btn btn-sm btn-outline-secondary" onClick={onRemove}>
          Remove
        </button>
      </div>
      <div className="col-md-5 px-3 my-3">
        <h4>{product.name}</h4>
        <span className={`${styles['column-label']}`}>
          <strong>Code:</strong> {product.code}
        </span>
        {discountPrice && <span className="price-badge badge text-bg-info">Promo!</span>}
        {twoPlusOne && <span className="price-badge badge text-bg-warning">2X1</span>}
        {promotion && (
          <div>
            <span className="fs-6 text-muted">{promotion}</span>
          </div>
        )}
      </div>
      <div className="col-md-auto px-3 my-3 text-center">
        <div className={styles['column-label']}>Quantity</div>
        <div className={styles['count-input']}>
          <div>
            <button className="btn btn-outline-secondary" onClick={handleDecrement}>
              -
            </button>
            <span className={styles['cart-counter']}>{count}</span>
            <button className="btn btn-outline-secondary" onClick={handleIncrement}>
              +
            </button>
          </div>
        </div>
      </div>
      <div className="col-md-2 px-3 my-3 text-center">
        <div className={styles['column-label']}>Price</div>
        <span className="text-xl font-weight-medium">{priceComponent()}</span>
      </div>
      <div className="col-md-auto px-3 my-3 text-center">
        <div className={styles['column-label']}>Subtotal</div>
        <span className="text-xl font-weight-medium">{subtotalComponent()}</span>
      </div>
    </div>
  )
}

export default CartItem
