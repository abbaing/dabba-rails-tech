class ProductModel {
  id: number
  name: string
  code: string
  price: number
  promotionMessage?: string
  promotionPrice?: number
  promotionQuantity?: number

  constructor(
    id: number,
    name: string,
    code: string,
    price: number,
    promotionMessage?: string,
    promotionPrice?: number,
    promotionQuantity?: number
  ) {
    this.id = id
    this.name = name
    this.code = code
    this.price = price
    this.promotionMessage = promotionMessage
    this.promotionPrice = promotionPrice
    this.promotionQuantity = promotionQuantity
  }
}

export default ProductModel
