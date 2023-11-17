import axios from 'axios'
import ProductModel from 'models/productModel'

const API_BASE_URL = process.env.API_BASE_URL

class ProductService {
  async getAll(): Promise<ProductModel[]> {
    try {
      const response = await axios.get(`${API_BASE_URL}/products`)
      return response.data as ProductModel[]
    } catch (error) {
      throw new Error('Error fetching products')
    }
  }
}

const productServiceInstance = new ProductService()
export default productServiceInstance
