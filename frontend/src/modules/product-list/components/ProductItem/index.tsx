import ProductModel from 'models/productModel'
import React from 'react'
import { formatCurrency } from 'utils/currencyUtils'
import './index.css'

interface Props {
  item: ProductModel
  onAddToCart: (item: ProductModel) => void
}

const ProductItem = ({ item, onAddToCart }: Props) => {
  const oldPriceComponent = (price?: number) => {
    return <span className='old-price'>{formatCurrency(price)}</span>
  }

  return (
    <div className='col'>
      <div className='card h-100'>
        <div className='card-body'>
          <h5 className='card-title'>{item.name}</h5>
          <p className='card-text'>Code {item.code}</p>
          <p className='card-text'>
            <small className='text-body-secondary'>
              {item.oldPrice && oldPriceComponent(item.oldPrice)}
              <span className='price'> {formatCurrency(item.price)}</span>
            </small>
          </p>
          <div className='alert alert-primary' role='alert'>
            {item.promotionMessage}
          </div>
        </div>
        <div className='card-footer'>
          <a
            href='#'
            className='btn btn-primary'
            onClick={() => onAddToCart(item)}
          >
            Add To Cart
          </a>
        </div>
      </div>
    </div>
  )
}

export default ProductItem
