import 'jest-localstorage-mock'
import CartModel from 'models/cartModel'
import ProductModel from 'models/productModel'
import CartUpdater from 'services/CartService/cartUpdater'
import cartStore from 'stores/cartStore'

jest.mock('stores/cartStore')

describe('CartUpdater', () => {
  let cartUpdater: CartUpdater

  const product: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01',
  }

  beforeEach(() => {
    cartUpdater = new CartUpdater()
  })

  afterEach(() => {
    jest.clearAllMocks()
  })

  it('should add a new item to the cart if it does not exist', () => {
    const quantity = 2;
    
    (cartStore.getItem as jest.Mock).mockReturnValue(undefined)

    cartUpdater.updateCart(product, quantity)

    expect(cartStore.addItem).toHaveBeenCalledWith(
      new CartModel(product, quantity)
    )
  })

  it('should update the quantity of an existing item in the cart', () => {
    const quantity = 5
    const existingCartItem = new CartModel(product, 3);

    (cartStore.getItem as jest.Mock).mockReturnValue(existingCartItem)

    cartUpdater.updateCart(product, quantity)

    expect(cartStore.updateItemQuantity).toHaveBeenCalledWith(
      product.id,
      quantity
    )
  })
})
