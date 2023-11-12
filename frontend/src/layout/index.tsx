import React, { ReactNode } from 'react'
import 'bootstrap/dist/css/bootstrap.min.css'
import Navbar from 'layout/navbar'

interface LayoutProps {
  children: ReactNode
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div>
      <Navbar />
      <div className='container mt-5'>
        <div>{children}</div>
      </div>
    </div>
  )
}

export default Layout
