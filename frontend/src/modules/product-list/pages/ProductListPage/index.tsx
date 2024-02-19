import Layout from 'layout'
import ProductModel from 'models/productModel'
import ProductItem from 'modules/product-list/components/ProductItem'
import React, { useEffect, useState } from 'react'
import { toast } from 'react-toastify'
import productService from 'services/ProductService'
import './index.css'

const ProductListPage = (): JSX.Element => {
  const [products, setProducts] = useState<ProductModel[]>([])

  useEffect(() => {
    const fetchOptions = async (): Promise<void> => {
      try {
        const response = await productService.getAll()
        setProducts(response as ProductModel[])
      } catch (error) {
        toast.error('There was a problem retrieving the data.')
      }
    }

    void fetchOptions()
  }, [])

  return (
    <Layout>
      <h1 className="display-5 pb-3 mb-3 border-bottom">Product Catalog</h1>
      <div className="container product-catalog-container">
        <div className="row row-cols-md-3 g-4">
          {products.map((item) => (
            <ProductItem key={item.id} item={item} />
          ))}
        </div>
      </div>
    </Layout>
  )
}

export default ProductListPage
