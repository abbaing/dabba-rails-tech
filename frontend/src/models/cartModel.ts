import { observable } from 'mobx'
import ProductModel from 'models/productModel'

class CartModel {
  product: ProductModel
  quantity: number

  constructor(product: ProductModel, quantity: number) {
    this.product = product
    this.quantity = quantity
  }
}

export default CartModel
