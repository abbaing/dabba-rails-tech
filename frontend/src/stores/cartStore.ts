import { action, computed, observable } from 'mobx'
import ProductModel from 'models/productModel'

class CartStore {
  @observable accessor items: ProductModel[] = []

  @action
  addItem(item: ProductModel): void {
    this.items.push(item)
  }

  @action
  removeItem(itemId: number): void {
    this.items = this.items.filter((item) => item.id !== itemId)
  }

  @computed
  get totalItems(): number {
    return this.items.length
  }
}

const cartStore = new CartStore()
export default cartStore
