import ProductModel from 'models/productModel'
import React, { useState } from 'react'
import { toast } from 'react-toastify'
import cartService from 'services/CartService'
import { formatCurrency } from 'utils/currencyUtils'
import './index.css'

interface Props {
  item: ProductModel
}

const ProductItem = ({ item }: Props) => {
  const [showSelector, setShowSelector] = useState(false)
  const [count, setCount] = useState(0)

  const handleIncrement = () => {
    let newCount = count + 1
    setCount(newCount)
    cartService.updateCart(item, newCount)

    toast.info(`${item.name} added to your cart!`)
  }

  const handleDecrement = () => {
    let newCount = count - 1
    if (newCount > 0) {
      setCount(newCount)
      cartService.updateCart(item, newCount)
    }
  }

  const priceComponent = () => {
    const hasPromotionPrice = item.promotionPrice
    const hasPromotionQuantity = item.promotionQuantity
    const applyPromotion = count === item.promotionQuantity

    if (hasPromotionQuantity && applyPromotion && hasPromotionPrice) {
      return (
        <small className='text-body-secondary'>
          <span className='old-price'>{formatCurrency(item.price)}</span>
          <span className='price'> {formatCurrency(item.promotionPrice)}</span>
        </small>
      )
    }
    if (hasPromotionQuantity && applyPromotion) {
      return (
        <small className='text-body-secondary'>
          <span className='price'> {formatCurrency(item.price)}</span>
          <span className='price-badge badge text-bg-warning'>2X1</span>
        </small>
      )
    } else {
      return (
        <small className='text-body-secondary'>
          <span className='price'> {formatCurrency(item.price)}</span>
        </small>
      )
    }
  }

  return (
    <div className='col'>
      <div className='card h-100'>
        <div className='card-body'>
          <h5 className='card-title'>{item.name}</h5>
          <p className='card-text'>Code {item.code}</p>
          <p className='card-text'>{priceComponent()}</p>
          <div className='alert alert-primary' role='alert'>
            {item.promotionMessage}
          </div>
        </div>
        <div className='card-footer'>
          {!showSelector && (
            <a
              href='#'
              className='btn btn-primary'
              onClick={() => {
                handleIncrement()
                setShowSelector(true)
              }}
            >
              Add To Cart
            </a>
          )}
          {showSelector && (
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
          )}
        </div>
      </div>
    </div>
  )
}

export default ProductItem
