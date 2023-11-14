import { Provider } from 'mobx-react'
import React from 'react'
import { createRoot } from 'react-dom/client'
import Routes from './routes'
import cartStore from './stores/cartStore'

const container = document.getElementById('root') as Element
const root = createRoot(container)
root.render(
  <Provider cartStore={cartStore}>
    <Routes />
  </Provider>
)
