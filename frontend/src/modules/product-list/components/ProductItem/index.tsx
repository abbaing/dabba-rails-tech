import React from 'react'
import './index.css'
import { formatCurrency } from 'utils/currencyUtils'

interface Props {
  name: string
  code: string
  price: number
  oldPrice?: number
  promotionMessage?: string
}

const ProductItem = ({
  name,
  code,
  price,
  oldPrice,
  promotionMessage,
}: Props) => {
  const oldPriceComponent = (price?: number) => {
    return <span className='old-price'>{formatCurrency(price)}</span>
  }

  return (
    <div className='col'>
      <div className='card h-100'>
        <div className='card-body'>
          <h5 className='card-title'>{name}</h5>
          <p className='card-text'>Code {code}</p>
          <p className='card-text'>
            <small className='text-body-secondary'>
              {oldPrice && oldPriceComponent(oldPrice)}
              <span className='price'> {formatCurrency(price)}</span>
            </small>
          </p>
          <p className='card-text'>
            <div className='alert alert-primary' role='alert'>
              {promotionMessage}
            </div>
          </p>
        </div>
        <div className='card-footer'>
          <a href='#' className='btn btn-primary'>
            Add To Cart
          </a>
        </div>
      </div>
    </div>
  )
}

export default ProductItem
