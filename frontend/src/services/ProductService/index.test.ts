import axios from 'axios'
import ProductModel from 'models/productModel'
import ProductService from 'services/ProductService'

jest.mock('axios')

const mockedAxios = axios as jest.Mocked<typeof axios>

describe('ProductService', () => {
  afterEach(() => {
    jest.resetAllMocks()
  })

  const product: ProductModel = {
    id: 1,
    name: 'Product 1',
    price: 10,
    code: 'P01',
  }

  it('should fetch products successfully', async () => {
    const mockProducts = [product]
    mockedAxios.get.mockResolvedValue({ data: mockProducts })

    const result = await ProductService.getAll()

    expect(result).toEqual(mockProducts)
  })

  it('should throw an error when fetching products fails', async () => {
    mockedAxios.get.mockRejectedValue(new Error('Network Error'))

    await expect(ProductService.getAll()).rejects.toThrow(
      'Error fetching products'
    )
  })
})
