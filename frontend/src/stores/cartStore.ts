import { action, computed, observable } from 'mobx'
import CartModel from 'models/cartModel'

class CartStore {
  @observable accessor items: CartModel[] = []

  @action
  addItem(item: CartModel): void {
    this.items.push(item)
  }

  @action
  updateItemQuantity(itemId: number, quantity: number): void {
    const itemToUpdate = this.items.find((item) => item.product.id === itemId)

    if (itemToUpdate) {
      itemToUpdate.quantity = quantity
    }
  }

  @action
  removeItem(itemId: number): void {
    this.items = this.items.filter((item) => item.product.id !== itemId)
  }

  @action
  getItem(itemId: number): CartModel | undefined {
    return this.items.find((item) => item.product.id === itemId)
  }

  @computed
  get totalItems(): number {
    return this.items.reduce((sum, current) => sum + current.quantity, 0)
  }
}

const cartStore = new CartStore()
export default cartStore
