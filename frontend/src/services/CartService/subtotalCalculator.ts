import axios from 'axios'
import ProductModel from 'models/productModel'

const API_BASE_URL = process.env.API_BASE_URL

class SubtotalCalculator {
  async calculateSubtotal(item: ProductModel, quantity: number): Promise<any> {
    try {
      const response = await axios.post(`${API_BASE_URL}/cart/subtotal`, {
        id: item.id,
        quantity
      })
      return response.data
    } catch (error) {
      throw new Error(`Error fetching subtotal`)
    }
  }
}

export default SubtotalCalculator
