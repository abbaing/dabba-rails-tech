import React, { ReactNode } from 'react'
import 'bootstrap/dist/css/bootstrap.min.css'

interface LayoutProps {
  children: ReactNode
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div className='container mt-5'>
      <h1 className='display-4'>My Bootstrap template</h1>
      <div>{children}</div>
    </div>
  )
}

export default Layout
