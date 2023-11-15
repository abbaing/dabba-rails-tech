import { inject, observer } from 'mobx-react'
import React from 'react'
import cartStore from 'stores/cartStore'

const Navbar = () => {
  const cartEmpty = false // cartStore.items.length === 0

  return (
    <nav className='navbar navbar-expand-md navbar-dark bg-dark'>
      <div className='container-fluid'>
        <a className='navbar-brand' href='#'>
          Tech Test
        </a>
        <button
          className='navbar-toggler'
          type='button'
          data-bs-toggle='collapse'
          data-bs-target='#navbarsExample04'
          aria-controls='navbarsExample04'
          aria-expanded='false'
          aria-label='Toggle navigation'
        >
          <span className='navbar-toggler-icon'></span>
        </button>

        <div className='collapse navbar-collapse' id='navbarsExample04'>
          <ul className='navbar-nav me-auto mb-2 mb-md-0'>
            <li className='nav-item'>
              <a className='nav-link active' aria-current='page' href='#'>
                Home
              </a>
            </li>
          </ul>
          <button type='button' className='btn btn-dark'>
            My Cart{' '}
            {!cartEmpty && (
              <span className='badge text-bg-secondary'>
                {cartStore.totalItems}
              </span>
            )}
          </button>
        </div>
      </div>
    </nav>
  )
}

export default inject('cartStore')(observer(Navbar))
