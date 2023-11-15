import { action, computed, observable } from 'mobx'
import CartModel from 'models/cartModel'

class CartStore {
  @observable accessor items: CartModel[] = []

  constructor() {
    const storedItems = localStorage.getItem('cartItems')
    if (storedItems) {
      this.items = JSON.parse(storedItems)
    }
  }

  @action
  addItem(item: CartModel): void {
    this.items.push(item)
    this.saveToLocalStorage()
  }

  @action
  updateItemQuantity(itemId: number, quantity: number): void {
    const itemToUpdate = this.items.find((item) => item.product.id === itemId)

    if (itemToUpdate) {
      itemToUpdate.quantity = quantity
      this.saveToLocalStorage()
    }
  }

  @action
  removeItem(itemId: number): void {
    this.items = this.items.filter((item) => item.product.id !== itemId)
    this.saveToLocalStorage()
  }

  @action
  getItem(itemId: number): CartModel | undefined {
    return this.items.find((item) => item.product.id === itemId)
  }

  @computed
  get totalItems(): number {
    const total = this.items.reduce((sum, current) => sum + current.quantity, 0)
    return isNaN(total) ? 0 : total
  }

  private saveToLocalStorage(): void {
    localStorage.setItem('cartItems', JSON.stringify(this.items))
  }
}

const cartStore = new CartStore()
export default cartStore
