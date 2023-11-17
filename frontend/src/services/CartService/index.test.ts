import 'jest-localstorage-mock'
import ProductModel from 'models/productModel'
import CartService from 'services/CartService'

jest.mock('services/CartService/cartUpdater')
jest.mock('services/CartService/subtotalCalculator')

describe('CartService', () => {
  beforeEach(() => {
    jest.clearAllMocks()
  })

  const product: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01',
  }

  it('debería llamar a updateCart en cartUpdater al llamar a updateCart', () => {
    const quantity = 1

    CartService.updateCart(product, quantity)

    expect(CartService['cartUpdater'].updateCart).toHaveBeenCalledWith(
      product,
      quantity
    )
  })

  it('debería llamar a calculateSubtotal en subtotalCalculator al llamar a calculateSubtotal', async () => {
    const quantity = 2

    await CartService.calculateSubtotal(product, quantity)

    expect(
      CartService['subtotalCalculator'].calculateSubtotal
    ).toHaveBeenCalledWith(product, quantity)
  })
})
