import CartRoutes from 'modules/cart/routes'
import ProductListRoutes from 'modules/product-list/routes'
import NotFoundPage from 'modules/shared/pages/NotFound'
import RootPage from 'modules/shared/pages/Root'
import React from 'react'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'

const Routes = (): JSX.Element => {
  const rootPath = [
    {
      path: '/',
      element: <RootPage />,
      errorElement: <NotFoundPage />,
    },
  ]
  const paths = [...rootPath, ...ProductListRoutes, ...CartRoutes]
  return (
    <React.StrictMode>
      <RouterProvider router={createBrowserRouter(paths)} />
    </React.StrictMode>
  )
}

export default Routes
