import { action, computed, observable } from 'mobx'
import CartModel from 'models/cartModel'
import {
  CartStorage,
  LocalStorageCartStorage,
} from 'stores/localStorageCartStorage'

export class CartStore {
  @observable accessor items: CartModel[] = []
  private storage: LocalStorageCartStorage

  constructor(storage: CartStorage) {
    this.storage = storage
    this.items = this.storage.load()
  }

  @action
  addItem(item: CartModel): void {
    this.items.push(item)
    this.saveToStorage()
  }

  @action
  updateItemQuantity(itemId: number, quantity: number): void {
    const itemToUpdate = this.items.find((item) => item.product.id === itemId)

    if (itemToUpdate) {
      itemToUpdate.quantity = quantity
      this.saveToStorage()
    }
  }

  @action
  removeItem(itemId: number): void {
    this.items = this.items.filter((item) => item.product.id !== itemId)
    this.saveToStorage()
  }

  @action
  getItem(itemId: number): CartModel | undefined {
    return this.items.find((item) => item.product.id === itemId)
  }

  @computed
  get totalItems(): number {
    return this.items.reduce((sum, current) => sum + current.quantity, 0)
  }

  private saveToStorage(): void {
    this.storage.save(this.items)
  }
}

const cartStorage = new LocalStorageCartStorage()
const cartStore = new CartStore(cartStorage)
export default cartStore
