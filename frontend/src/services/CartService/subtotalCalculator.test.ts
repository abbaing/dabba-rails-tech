import axios from 'axios'
import ProductModel from 'models/productModel'
import SubtotalCalculator from 'services/CartService/subtotalCalculator'

jest.mock('axios')

const mockedAxios = axios as jest.Mocked<typeof axios>

describe('SubtotalCalculator', () => {
  const product: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01',
  }

  afterEach(() => {
    jest.clearAllMocks()
  })

  describe('calculateSubtotal', () => {
    it('should calculate subtotal correctly', async () => {
      const quantity = 2
      const expectedSubtotal = 20

      mockedAxios.post.mockResolvedValueOnce({
        data: { subtotal: expectedSubtotal },
      })

      const subtotalCalculator = new SubtotalCalculator()
      const result = await subtotalCalculator.calculateSubtotal(
        product,
        quantity
      )

      expect(result).toEqual({ "subtotal": expectedSubtotal })
    })

    it('should throw an error if API call fails', async () => {
      const quantity = 2

      mockedAxios.post.mockRejectedValueOnce(new Error())

      const subtotalCalculator = new SubtotalCalculator()

      await expect(
        subtotalCalculator.calculateSubtotal(product, quantity)
      ).rejects.toThrow(`Error fetching subtotal`)
    })
  })
})
