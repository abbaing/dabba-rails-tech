import 'jest-localstorage-mock'
import CartModel from 'models/cartModel'
import ProductModel from 'models/productModel'
import { CartStore } from 'stores/cartStore'
import { CartStorage } from 'stores/localStorageCartStorage'

class MockCartStorage implements CartStorage {
  private storedItems: CartModel[] = []

  save(items: CartModel[]): void {
    this.storedItems = items
  }

  load(): CartModel[] {
    return this.storedItems
  }
}

describe('CartStore tests', () => {
  let cartStore: CartStore
  let mockCartStorage: MockCartStorage

  const product_1: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01'
  }
  const product_2: ProductModel = {
    id: 2,
    name: 'Product 2',
    price: 20,
    code: 'P02'
  }

  const item: CartModel = {
    product: product_1,
    quantity: 1
  }

  beforeEach(() => {
    mockCartStorage = new MockCartStorage()
    cartStore = new CartStore(mockCartStorage)
  })

  it('should add an item to the cart', () => {
    cartStore.addItem(item)

    expect(cartStore.items).toEqual([expect.objectContaining(item)])
    expect(mockCartStorage.load()).toEqual([expect.objectContaining(item)])
  })

  it('should update item quantity in the cart', () => {
    cartStore.addItem(item)

    cartStore.updateItemQuantity(1, 2)

    const updatedItem = cartStore.items.find((i) => i.product.id === 1)
    expect(updatedItem?.quantity).toBe(2)
    expect(mockCartStorage.load()).toContainEqual(updatedItem)
  })

  it('should remove an item from the cart', () => {
    cartStore.addItem(item)

    cartStore.removeItem(1)

    expect(cartStore.items).toHaveLength(0)
    expect(mockCartStorage.load()).toHaveLength(0)
  })

  it('should get an item from the cart', () => {
    cartStore.addItem(item)

    const retrievedItem = cartStore.getItem(1)

    expect(retrievedItem).toEqual(item)
  })

  it('should calculate the total number of items in the cart', () => {
    const item2: CartModel = {
      product: product_2,
      quantity: 2
    }
    cartStore.addItem(item)
    cartStore.addItem(item2)

    const totalItems = cartStore.totalItems

    expect(totalItems).toBe(3)
  })
})
