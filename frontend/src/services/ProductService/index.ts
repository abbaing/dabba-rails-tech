import ProductModel from 'models/productModel'
import axios from 'axios'

const API_BASE_URL = 'http://localhost:3000' // process.env.BACKEND_URL

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
