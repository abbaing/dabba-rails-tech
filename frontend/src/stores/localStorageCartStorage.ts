import CartModel from 'models/cartModel'

export interface CartStorage {
  save(items: CartModel[]): void
  load(): CartModel[]
}

export  class LocalStorageCartStorage implements CartStorage {
  save(items: CartModel[]): void {
    localStorage.setItem('cartItems', JSON.stringify(items))
  }

  load(): CartModel[] {
    const storedItems = localStorage.getItem('cartItems')
    return storedItems ? JSON.parse(storedItems) : []
  }
}
