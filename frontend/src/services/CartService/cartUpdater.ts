import CartModel from 'models/cartModel'
import ProductModel from 'models/productModel'
import cartStore from 'stores/cartStore'

class CartUpdater {
  updateCart(item: ProductModel, quantity: number) {
    const previousItem = cartStore.getItem(item.id)

    if (previousItem === undefined) {
      cartStore.addItem(new CartModel(item, quantity))
    } else {
      cartStore.updateItemQuantity(item.id, quantity)
    }
  }
}

export default CartUpdater
