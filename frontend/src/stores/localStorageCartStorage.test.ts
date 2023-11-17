import 'jest-localstorage-mock'
import CartModel from 'models/cartModel'
import ProductModel from 'models/productModel'
import { LocalStorageCartStorage } from 'stores/localStorageCartStorage'

describe('LocalStorageCartStorage', () => {
  beforeEach(() => {
    localStorage.clear()
  })

  const product: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01',
  }

  const item: CartModel = {
    product: product,
    quantity: 1,
  }

  describe('save method', () => {
    test('should save cart items to localStorage', () => {
      const cartStorage = new LocalStorageCartStorage()
      const cartItems: CartModel[] = [item]

      cartStorage.save(cartItems)

      const storedItems = JSON.parse(localStorage.getItem('cartItems') || '[]')
      expect(storedItems).toEqual(cartItems)
    })
  })

  describe('load method', () => {
    test('should load cart items from localStorage', () => {
      const cartStorage = new LocalStorageCartStorage()
      const cartItems: CartModel[] = [item]

      localStorage.setItem('cartItems', JSON.stringify(cartItems))

      const loadedItems = cartStorage.load()
      expect(loadedItems).toEqual(cartItems)
    })

    test('should return an empty array if no items are stored', () => {
      const cartStorage = new LocalStorageCartStorage()

      const loadedItems = cartStorage.load()
      expect(loadedItems).toEqual([])
    })
  })
})
