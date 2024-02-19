import ProductModel from 'models/productModel'
import CartUpdater from 'services/CartService/cartUpdater'
import SubtotalCalculator, { SubtotalResponse } from 'services/CartService/subtotalCalculator'

export class CartService {
  private cartUpdater: CartUpdater
  private subtotalCalculator: SubtotalCalculator

  constructor(cartUpdater: CartUpdater, subtotalCalculator: SubtotalCalculator) {
    this.cartUpdater = cartUpdater
    this.subtotalCalculator = subtotalCalculator
  }

  updateCart(item: ProductModel, quantity: number) {
    this.cartUpdater.updateCart(item, quantity)
  }

  async calculateSubtotal(item: ProductModel, quantity: number): Promise<SubtotalResponse> {
    return this.subtotalCalculator.calculateSubtotal(item, quantity)
  }
}

const cartUpdaterInstance = new CartUpdater()
const subtotalCalculatorInstance = new SubtotalCalculator()
const cartServiceInstance = new CartService(cartUpdaterInstance, subtotalCalculatorInstance)

export default cartServiceInstance
