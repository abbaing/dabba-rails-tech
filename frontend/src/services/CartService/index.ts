import CartModel from 'models/cartModel'
import ProductModel from 'models/productModel'
import cartStore from 'stores/cartStore'
import axios from 'axios'

const API_BASE_URL = 'http://localhost:3000' // process.env.BACKEND_URL

class CartService {
  updateCart(item: ProductModel, quantity: number) {
    const previousItem = cartStore.getItem(item.id)

    if (previousItem === undefined) {
      cartStore.addItem(new CartModel(item, quantity))
    } else {
      cartStore.updateItemQuantity(item.id, quantity)
    }
  }

  async calculateSubtotal(
    item: ProductModel,
    quantity: number
  ): Promise<number> {
    try {
      const response = await axios.post(`${API_BASE_URL}/carts/subtotal`, {
        id: item.id,
        quantity,
      })
      return response.data.subtotal as number
    } catch (error) {
      throw new Error('Error fetching subtotal')
    }
  }
}

const cartServiceInstance = new CartService()
export default cartServiceInstance
