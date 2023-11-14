class ProductModel {
  id: number
  name: string
  code: string
  price: number
  promotionMessage?: string
  oldPrice?: number

  constructor(
    id: number,
    name: string,
    code: string,
    price: number,
    promotionMessage: string,
    oldPrice: number
  ) {
    this.id = id
    this.name = name
    this.code = code
    this.price = price
    this.promotionMessage = promotionMessage
    this.oldPrice = oldPrice
  }
}

export default ProductModel
