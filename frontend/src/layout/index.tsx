import React, { ReactNode } from 'react'
import 'bootstrap/dist/css/bootstrap.min.css'
import Navbar from 'layout/navbar'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'

interface LayoutProps {
  children: ReactNode
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div>
      <Navbar />
      <ToastContainer position="top-right"
autoClose={5000}
hideProgressBar={false}
newestOnTop={false}
closeOnClick
rtl={false}
pauseOnFocusLoss
draggable
pauseOnHover
theme="light" />
      <div className='container mt-5'>
        <div>{children}</div>
      </div>
    </div>
  )
}

export default Layout
